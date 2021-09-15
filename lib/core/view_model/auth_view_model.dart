import 'package:e_commerceapp/core/services/firestore_user.dart';
import 'package:e_commerceapp/helper/local_storage_data.dart';
import 'package:e_commerceapp/models/user_model.dart';
import 'package:e_commerceapp/view/control_view.dart';
import 'package:e_commerceapp/view/home_view.dart';
import 'package:e_commerceapp/view/navigation_screens_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin facebookLogin = FacebookLogin();

  String name, email, password;
  Rxn<User> _user = Rxn<User>();

  String get user => _user.value?.email;
  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  void googleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    await _auth.signInWithCredential(credential).then((user) async {
      saveUserData(user);
      Get.offAll(ControlView());
    });
  }




  // void facebookSignInMethod() async {
  //
  //   final FacebookLoginResult result = await facebookLogin.logIn(
  //     permissions: [
  //       FacebookPermission.publicProfile,
  //       FacebookPermission.email,
  //     ],
  //   );
  //   final FacebookAuthCredential facebookAuthCredential =
  //   FacebookAuthProvider.credential(result.accessToken.token);
  //
  //   await _auth.signInWithCredential(facebookAuthCredential).then((user) {
  //     saveUserData(user);
  //     Get.offAll(() => ControlView());
  //
  //   });
  // }
  void facebookSignIn() async {
    final FacebookLoginResult result = await facebookLogin.logIn(
      permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ],
    );
    switch (result.status) {
      case FacebookLoginStatus.success:
        // Logged in

        // Send access token to server for validation and auth
        final FacebookAccessToken accessToken = result.accessToken;
        print('Access token: ${accessToken.token}');

        // Get profile data
        final profile = await facebookLogin.getUserProfile();
        print('Hello, ${profile.name}! You ID: ${profile.userId}');

        // Get user profile image url
        final imageUrl = await facebookLogin.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');

        // Get email (since we request email permission)
        final email = await facebookLogin.getUserEmail();
        // But user can decline permission
        if (email != null) print('And your email is $email');

        break;
      case FacebookLoginStatus.cancel:
        // User cancel log in
        break;
      case FacebookLoginStatus.error:
        // Log in failed
        print('Error while log in: ${result.error}');
        break;
    }
    final FacebookAccessToken accessToken = result.accessToken;


    if (result.status == FacebookLoginStatus.success) {
      final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);
      print(credential);
      await _auth.signInWithCredential(credential).then((value) {
        saveUserData(value);
        Get.offAll(() => ControlView());
      });
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FirestoreUser()
            .getCurrentUser(value.user.uid)
            .then((value) async {
          setUser(UserModel.fromJson(value.data()));
        });
      });
      Get.offAll(() => ControlView());
      //Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar("Error Login Account !", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createUserWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUserData(user);
      });
      Get.offAll(() => ControlView());

    } catch (e) {
      Get.snackbar("Error in Creating Account !", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUserData(UserCredential user) async {

    UserModel userModel =
        UserModel(
            userId: user.user.uid,
            email: user.user.email,
            name:  name == null ? user.user.displayName : name,
            pic:   user.user.photoURL != null ? user.user.photoURL:'',
          );
    await FirestoreUser().addUserToFirestore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}

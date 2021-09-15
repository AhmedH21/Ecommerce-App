import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerceapp/models/user_model.dart';

class FirestoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFirestore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }


  Future<DocumentSnapshot> getCurrentUser(String uid) async{

    return await _userCollectionRef.doc(uid).get();

  }
}

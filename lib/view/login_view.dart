import 'package:e_commerceapp/constants.dart';
import 'package:e_commerceapp/core/view_model/auth_view_model.dart';
import 'package:e_commerceapp/view/register_view.dart';
import 'package:e_commerceapp/view/widgets/custom_socialButton.dart';
import 'package:e_commerceapp/view/widgets/custom_textForm.dart';
import 'package:e_commerceapp/view/widgets/custom_button.dart';
import 'package:e_commerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: 'Welcome,', fontSize: 30, color: Colors.black),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: CustomText(
                          text: 'Sign Up', fontSize: 18, color: primaryColor),
                    ),
                  ],
                ),
                CustomText(
                  text: 'Sign in to Continue',
                  fontSize: 14,
                  color: Colors.grey,
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextForm(
                  text: "Email",
                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextForm(
                  text: "Password",
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: "SIGN IN",
                  onPressed: () {
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: '- OR -',
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomSocialButton(
                  onPress: () {
                    controller.googleSignIn();
                  },
                  text: 'Sign In with Google',
                  imageName: 'assets/images/google.png',
                ),
                SizedBox(
                  height: 25,
                ),
                CustomSocialButton(
                  onPress: () {
                    controller.facebookSignIn();
                  },
                  text: 'Sign In with Facebook',
                  imageName: 'assets/images/facebook.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

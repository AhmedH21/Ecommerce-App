import 'package:e_commerceapp/core/view_model/auth_view_model.dart';
import 'package:e_commerceapp/view/widgets/custom_textForm.dart';
import 'package:e_commerceapp/view/widgets/custom_button.dart';
import 'package:e_commerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_view.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.to(LoginView());
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Sign Up', fontSize: 30, color: Colors.black),
                SizedBox(
                  height: 40,
                ),
                CustomTextForm(
                  text: "Name",
                  onSave: (value) {
                    controller.name = value;
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
                  text: "SIGN UP",
                  onPressed: () {
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()) {
                      controller.createUserWithEmailAndPassword();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

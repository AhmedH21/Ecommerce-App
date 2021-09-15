import 'package:e_commerceapp/core/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_view.dart';
import 'widgets/custom_listTile.dart';
import 'widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: Get.put(ProfileViewModel()),
      builder: (controller) => controller.loading.value == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: Container(
                padding: EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                image: DecorationImage(
                                    image: controller.userModel == null ||
                                            controller.userModel.pic == ''
                                        ? AssetImage('assets/images/avatar.png')
                                        : NetworkImage(
                                            controller.userModel.pic),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  CustomText(
                                    text: controller.userModel.name,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  CustomText(
                                    text: controller.userModel.email,
                                    color: Colors.black,
                                    fontSize: 12,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      CustomListTile(
                        icon: Icons.navigate_next,
                        imagePath: 'assets/icons/Icon_Edit-Profile.png',
                        text: 'Edit Profile',
                        onPressed: () {},
                      ),
                      CustomListTile(
                        icon: Icons.navigate_next,
                        imagePath: 'assets/icons/Icon_Location.png',
                        text: 'Shipping Address',
                        onPressed: () {},
                      ),
                      CustomListTile(
                        icon: Icons.navigate_next,
                        imagePath: 'assets/icons/Icon_History.png',
                        text: 'Order History',
                        onPressed: () {},
                      ),
                      CustomListTile(
                        icon: Icons.navigate_next,
                        imagePath: 'assets/icons/Icon_Payment.png',
                        text: 'Cards',
                        onPressed: () {},
                      ),
                      CustomListTile(
                        icon: Icons.navigate_next,
                        imagePath: 'assets/icons/Icon_Alert.png',
                        text: 'Notifications',
                        onPressed: () {},
                      ),

                      CustomListTile(
                        icon: Icons.logout,
                        imagePath: 'assets/icons/Icon_Exit.png',
                        text: 'Log Out',
                        onPressed: () {
                          controller.signOut();
                          Get.offAll(LoginView());
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}



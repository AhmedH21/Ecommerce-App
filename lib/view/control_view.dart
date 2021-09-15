import 'package:e_commerceapp/core/view_model/auth_view_model.dart';
import 'package:e_commerceapp/core/view_model/control_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return (Get.find<AuthViewModel>().user == null)
            ? LoginView()
            : GetBuilder<ControlViewModel>(
                init: ControlViewModel(),
                builder: (controller) => Scaffold(
                  body: controller.children[controller.currentIndex],
                  bottomNavigationBar: BottomNavigationBar(
                    selectedItemColor: Colors.black,
                    backgroundColor: Colors.grey.shade50,
                    elevation: 0,
                    currentIndex: controller.currentIndex,
                    onTap: controller.onTab,
                    items: [
                      BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Image.asset(
                            'assets/icons/Icon_Explore.png',
                            fit: BoxFit.contain,
                            width: 20,
                          ),
                        ),
                        activeIcon: Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text("Explore"),
                        ),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Image.asset(
                            'assets/icons/Icon_Cart.png',
                            fit: BoxFit.contain,
                            width: 20,
                          ),
                        ),
                        activeIcon: Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text("Cart"),
                        ),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Image.asset(
                            'assets/icons/Icon_User.png',
                            fit: BoxFit.contain,
                            width: 20,
                          ),
                        ),
                        activeIcon: Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text("Account"),
                        ),
                        label: "",
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

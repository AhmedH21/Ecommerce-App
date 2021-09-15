import 'package:e_commerceapp/view/cart_view.dart';
import 'package:e_commerceapp/view/navigation_screens_view.dart';
import 'package:e_commerceapp/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  void onTab(int index) {
    _currentIndex = index;
    update();
  }

  List<Widget> _children = [
    NavigationScreensView(),
    CartView(),
    ProfileScreen(),
  ];

  get children => _children;
}

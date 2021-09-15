import 'package:e_commerceapp/view/control_view.dart';
import 'package:e_commerceapp/view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/view_model/cart_view_model.dart';
import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'SourceSansPro'),
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home:
      SafeArea(
        child: Scaffold(
          body: ControlView(),
        ),
      ),
    );
  }
}

import 'package:e_commerceapp/core/view_model/auth_view_model.dart';
import 'package:e_commerceapp/core/view_model/cart_view_model.dart';
import 'package:e_commerceapp/core/view_model/control_view_model.dart';
import 'package:e_commerceapp/core/view_model/home_view__model.dart';
import 'package:e_commerceapp/core/view_model/profile_view_model.dart';
import 'package:e_commerceapp/helper/local_storage_data.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => LocalStorageData());
  }
}

import 'package:e_commerceapp/core/services/database/cart_dbHelper.dart';
import 'package:e_commerceapp/models/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  CartViewModel() {
    getAllProduct();
  }

  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;

  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  var dbHelper = CartDatabaseHelper.db;
  getAllProduct() async {
    _loading.value = true;

    _cartProductModel = await dbHelper.getAllProduct();
    print(_cartProductModel.length);
    _loading.value = false;

    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
      print(_totalPrice);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }

    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice +=
        (double.parse(cartProductModel.price) * cartProductModel.quantity);

    update();
  }

  increaseQuantity(int index) async{
    _cartProductModel[index].quantity++;

    _totalPrice +=( double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreseQuantity(int index) async{
   if (_cartProductModel[index].quantity >0){
     _cartProductModel[index].quantity--;

     _totalPrice -= (double.parse(_cartProductModel[index].price));
     await dbHelper.updateProduct(_cartProductModel[index]);
     update();
   }
  }
}

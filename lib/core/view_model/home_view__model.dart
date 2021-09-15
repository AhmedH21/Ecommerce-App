import 'package:e_commerceapp/core/services/home_service.dart';
import 'package:e_commerceapp/models/category_model.dart';
import 'package:e_commerceapp/models/product_model.dart';
import 'package:e_commerceapp/view/cart_view.dart';
import 'package:e_commerceapp/view/navigation_screens_view.dart';
import 'package:e_commerceapp/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class HomeViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  List<CategoryModel> _categoryModel = [];

  List<CategoryModel> get categoryModel => _categoryModel;

  List<ProductModel> _productModel = [];

  List<ProductModel> get productModel => _productModel;

  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  void onTab(int index) {
    _currentIndex = index;
    update();
  }

  final List<Widget> _children = [
    NavigationScreensView() ,
    CartView(),
    ProfileScreen(),
  ];

  get children => _children;

  HomeViewModel() {
    getCategory();
    getBestSellingProduct();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProduct() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  // Future<List<ProductModel>> fetchProducts() async {
  //   final url = Uri.parse('https://fakestoreapi.com/products');
  //   http.Response response =
  //
  //   await http.get(url, headers: {'Accept': 'application/json'});
  //
  //   if (response.statusCode == 200) {
  //     List<dynamic> product = jsonDecode(response.body);
  //     return product;
  //   } else {
  //     throw Exception('Failed to load Product');
  //   }
  // }

  // Future<List<dynamic>> product;
  // @override
  // void onInit() {
  //   super.onInit();
  // product = fetchProducts();
  // }
  // Future<List<Post>> fetchPost() async {
  //   final response =
  //   await http.get(Uri.parse('https://fakestoreapi.com/products'));
  //
  //   if (response.statusCode == 200) {
  //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  //
  //     return parsed.map<Post>((json) => Post.fromMap(json)).toList();
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }
  //
  //   Future<List<Post>> futurePost;
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   futurePost = fetchPost();
  // }
}

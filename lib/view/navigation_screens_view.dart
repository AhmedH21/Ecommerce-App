import 'package:e_commerceapp/core/view_model/home_view__model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import 'details_view.dart';
import 'widgets/custom_text.dart';

class NavigationScreensView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => controller.loading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _searchWidget(),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "Categories",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewCategory(),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Products",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          // CustomText(
                          //   text: "See all",
                          //   fontWeight: FontWeight.bold,
                          //   fontSize: 16,
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewProduct()
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _searchWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            width: 25,
          ),
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(.0),
                    child: Image.network(controller.categoryModel.reversed
                        .toList()[index]
                        .image),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: controller.categoryModel.reversed.toList()[index].name,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _listViewProduct() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            width: 25,
          ),
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsView(model: controller.productModel[index]));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white70),
                        width: MediaQuery.of(context).size.width * .4,
                        child: Container(
                          height: 150,
                          child: Image.network(
                            controller.productModel[index].image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: controller.productModel[index].name,
                        alignment: Alignment.bottomLeft,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: controller.productModel[index].description
                            .substring(0, 40),
                        alignment: Alignment.bottomLeft,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                          text: '\$' + controller.productModel[index].price,
                          fontSize: 22,
                          alignment: Alignment.bottomLeft,
                          color: primaryColor),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

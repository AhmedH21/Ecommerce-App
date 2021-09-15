import 'package:e_commerceapp/constants.dart';
import 'package:e_commerceapp/core/view_model/cart_view_model.dart';
import 'package:e_commerceapp/models/cart_product_model.dart';
import 'package:e_commerceapp/models/product_model.dart';
import 'package:e_commerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/custom_button.dart';

class DetailsView extends StatelessWidget {
  ProductModel model = ProductModel();

  DetailsView({this.model});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(

                width: MediaQuery.of(context).size.width *.5,
                child: Image.network(
                  model.image,
                  fit: BoxFit.cover,
                ),

              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: model.name,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.white70),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: 'Size',
                                  ),
                                  CustomText(
                                    text: model.size,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.grey.shade400),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: 'Color',
                                  ),
                                  Container(
                                    width: 25,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: model.color,
                                      borderRadius: BorderRadius.circular(22),
                                      border:
                                          Border.all(color: Colors.grey.shade300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: 'Details',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: model.description,
                          fontSize: 20,
                          spaceLine: 2,
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: 'PRICE',
                        color: Colors.blueGrey,
                        fontSize: 20,
                      ),
                      CustomText(
                        text: '\$ ' + model.price,
                        color: primaryColor,
                        fontSize: 20,
                      ),
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: Get.find(),
                    builder: (controller) => CustomButton(
                      text: "Add",
                      onPressed: () {
                        controller.addProduct(
                          CartProductModel(
                              name: model.name,
                              image: model.image,
                              price: model.price,
                              quantity: 1,
                          productId: model.productId),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

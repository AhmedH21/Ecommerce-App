import 'package:e_commerceapp/constants.dart';
import 'package:e_commerceapp/core/view_model/cart_view_model.dart';
import 'package:e_commerceapp/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'checkout/checkout_view.dart';
import 'widgets/custom_text.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder:(controller)=> Scaffold(
        body: controller.cartProductModel.length == 0
            ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
          children: [
              SvgPicture.asset(
                'assets/images/empty_cart.svg',
                height: 200,
                width: 200,
              ),
              SizedBox(height: 20,),
              CustomText(
                text: 'Cart is Empty :(',
                fontSize: 22,
              )
          ],
        ),
            )
            :Column(
          children: [
            Expanded(
              child:  Container(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                          itemCount: controller.cartProductModel.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 150,
                              child: Row(
                                children: [
                                  Container(
                                    width: 150,
                                    child: Image.network(
                                      controller.cartProductModel[index].image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: CustomText(
                                              text: controller
                                                  .cartProductModel[index].name,
                                              fontSize: 22,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(
                                            child: CustomText(
                                              text:
                                                  '\$ ${controller.cartProductModel[index].price.toString()}',
                                              fontSize: 15,
                                              color: primaryColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 40,
                                              width: 140,
                                              color: Colors.grey.shade200,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                    ),
                                                    onTap: () {
                                                      controller.increaseQuantity(
                                                          index);
                                                    },
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  CustomText(
                                                    text: controller
                                                        .cartProductModel[index]
                                                        .quantity
                                                        .toString(),
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  GestureDetector(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                bottom: 10.0),
                                                        child: Icon(
                                                          Icons.minimize_sharp,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        controller
                                                            .decreseQuantity(
                                                                index);
                                                      }),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
              ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: 'TOTAL',
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                      GetBuilder<CartViewModel>(
                        init: Get.find(),
                        builder: (controller) => CustomText(
                          text: '\$ ${controller.totalPrice}',
                          fontSize: 20,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 160,
                    child: CustomButton(
                      text: "CHECKOUT",
                      onPressed: () {
                        Get.to(CheckOutView());
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

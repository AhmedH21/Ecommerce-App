// import 'package:e_commerceapp/core/view_model/home_view__model.dart';
// import 'package:e_commerceapp/models/post_model.dart';
// import 'package:e_commerceapp/models/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ApiTestView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: GetBuilder<HomeViewModel>(
//           init: Get.find(),
//           builder:(controller)=> FutureBuilder<List<Post>>(
//             future: controller.futurePost,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (_, index) => Container(
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                       padding: EdgeInsets.all(20.0),
//                       decoration: BoxDecoration(
//                         color: Color(0xff97FFFF),
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image.network("${snapshot.data[index].image}")
//                           // Text(
//                           //   "${snapshot.data[index].description}",
//                           //   style: TextStyle(
//                           //     fontSize: 15.0,
//                           //     fontWeight: FontWeight.bold,
//                           //   ),
//                           // ),
//
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               } else {
//                 return Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
//         ),
//     );
//
//   }
//
//
// }
//

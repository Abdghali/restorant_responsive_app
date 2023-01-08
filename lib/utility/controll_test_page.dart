// import 'package:flutter/material.dart';
// import 'package:restaurant_app/data/services/food_services.dart';
// import '../business_logic/home_page_controller copy 2.dart';
// import '../data/services/food_service2.dart';
// import 'package:get/get.dart';

// class ControlTestPage extends StatefulWidget {
//   const ControlTestPage({Key? key}) : super(key: key);

//   @override
//   State<ControlTestPage> createState() => _ControlTestPageState();
// }

// class _ControlTestPageState extends State<ControlTestPage> {
//   final getcontroller = Get.put(HomePageController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               foodItems.forEach((element) {
//                 FoodItemsService.instance.storeFoodItem(element);
//               });
//             },
//             child: Text('Create foodItems'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               foodItems.forEach((element) {
//                 FoodItemsService.instance.storeFoodItem(element);
//               });
//             },
//             child: Text('Create  foodItems'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               foodItems.forEach((element) {
//                 FoodItemsService.instance.setFoodItemToFavorite(element);
//               });
//             },
//             child: Text('Create Favorats foodItems'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               foodItems.forEach((element) {
//                 FoodItemsService.instance.setFoodItemtoCart(element);
//               });
//             },
//             child: Text('Create cart foodItems'),
//           ),
//           ElevatedButton(
//             onPressed: () {},
//             child: Text('get All foodItems'),
//           ),
//           Obx(() => Text(
//               'value : ${getcontroller.listOfFoodItem.value.length.toString()}')),
//           Container(
//               height: 100,
//               child: Obx(() {
//                 return ListView.builder(
//                     itemCount: getcontroller.listOfFoodItem.value.length,
//                     itemBuilder: (context, index) {
//                       return Text(getcontroller.listOfFoodItem.value[index].name
//                           .toString());
//                     });
//               })),
//         ],
//       ),
//     );
//   }
// }

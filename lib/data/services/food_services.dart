import '../models/food_item.dart';

List<FoodItem> foodItemfoodItems = [
  FoodItem(
      id: 1,
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-classic-stuffed-peppers-vertical-1538066317.jpg?crop=1xw:1xh;center,top&resize=980:*',
      name: "Classic Stuffed Peppers",
      price: 46,
      description:
          'The bell pepper is an excellent vessel for stuffing meat, rice, and, of course, cheese. It\'s strong enough to hold its shape in the oven, and the flavor is subtle enough to go well with just about anything. This is our favorite recipe, but the customization options are endless.',
      rating: 1.0,
      isFavourite: true),
  FoodItem(
      id: 2,
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-202101-blackbeantostadas-046-ls-1610740382.jpg?crop=0.835xw:1.00xh;0,0&resize=980:*',
      name: "Black Bean Tostadas",
      price: 46,
      description: 'Meal2',
      rating: 2.0,
      isFavourite: true),
  FoodItem(
      id: 3,
      imageUrl:
          'https://media.istockphoto.com/id/598703000/photo/food-diversity-on-a-stone-dish.jpg?b=1&s=612x612&w=0&k=20&c=Hkxsqy-nNbNLycxc_Xh1XL1Im4OwI533E4ppmXV1Km8=',
      name: "Meal3",
      price: 46,
      description: 'Meal3',
      rating: 3.0,
      isFavourite: true),
  FoodItem(
      id: 4,
      imageUrl:
          'https://media.istockphoto.com/id/696931304/photo/watermelon-smoothies.jpg?b=1&s=612x612&w=0&k=20&c=c4ySRaiGxL_0cdNfMNmR7pORfVnO6eCswh2lXVLyPw0=',
      name: "Meal4",
      price: 46,
      description: 'Meal4',
      rating: 4.0,
      isFavourite: true),
  FoodItem(
      id: 5,
      imageUrl:
          'https://media.istockphoto.com/id/1249950828/photo/fish-sticks-fish-fillet-fingers-breaded-and-deep-fried.jpg?s=612x612&w=0&k=20&c=PLIniY9Uys8ePyhcnkdt6vuMRr7TMXw5Lw0yO8MOoDE=',
      name: "Meal5",
      price: 46,
      description: 'Meal5',
      rating: 5.0,
      isFavourite: true),
];

var favoritesfood = [
  FoodItem(
      id: 6,
      imageUrl:
          'https://media.istockphoto.com/id/1286487260/photo/grilled-turkey-breast-steaks-black-background-top-view.jpg?s=612x612&w=0&k=20&c=Y4uEQVWngTtu_Wz5D7t6ZPU3d0ervnKvpEdKNoBELXo=',
      name: "Meal6",
      price: 46,
      description: 'Meal6',
      rating: 4.0),
  FoodItem(
      id: 7,
      imageUrl:
          'https://media.istockphoto.com/id/1406650443/photo/bacon-and-cheese-quiche-with-hash-brown-crust.jpg?s=612x612&w=0&k=20&c=dD5gBO6Z3VQV-527m1MB5qnOwn_KyOjjz2KxAwW_t34=',
      name: "Meal7",
      price: 46,
      description: 'Meal7',
      rating: 4.0),
  FoodItem(
      id: 8,
      imageUrl:
          'https://media.istockphoto.com/id/1388230731/photo/potatoes-latkes-with-sour-cream-spinach-salad-tomatoes-and-boiled-eggs-on-dark-wooden-old.jpg?s=612x612&w=0&k=20&c=Qfvk-rSvsmC-zyilGqFjm0-qzL4qhOodIR7on6CVsJQ=',
      name: "Meal8",
      price: 46,
      description: 'Meal8',
      rating: 4.0),
];

List<FoodItem> cartFoodItemList = [
  FoodItem(
      id: 9,
      imageUrl:
          'https://media.istockphoto.com/id/1286487260/photo/grilled-turkey-breast-steaks-black-background-top-view.jpg?s=612x612&w=0&k=20&c=Y4uEQVWngTtu_Wz5D7t6ZPU3d0ervnKvpEdKNoBELXo=',
      name: "Meal6",
      price: 46,
      description: 'Meal6',
      rating: 4.0),
  FoodItem(
      id: 10,
      imageUrl:
          'https://media.istockphoto.com/id/1406650443/photo/bacon-and-cheese-quiche-with-hash-brown-crust.jpg?s=612x612&w=0&k=20&c=dD5gBO6Z3VQV-527m1MB5qnOwn_KyOjjz2KxAwW_t34=',
      name: "Meal7",
      price: 46,
      description: 'Meal7',
      rating: 4.0),
  FoodItem(
      id: 11,
      imageUrl:
          'https://media.istockphoto.com/id/1388230731/photo/potatoes-latkes-with-sour-cream-spinach-salad-tomatoes-and-boiled-eggs-on-dark-wooden-old.jpg?s=612x612&w=0&k=20&c=Qfvk-rSvsmC-zyilGqFjm0-qzL4qhOodIR7on6CVsJQ=',
      name: "Meal8",
      price: 46,
      description: 'Meal8',
      rating: 4.0),
];






  // CupertinoButton(
  //                         child: const Icon(CupertinoIcons.heart),
  //                         onPressed: () {
  //                           // Add item to favorites
  //                         },
  //                       ),

// Cupertino Dialog
//  showCupertinoDialog(
//           context: context,
//           builder: (BuildContext context) => CupertinoAlertDialog(
//             title: const Text('Card is clicked.'),
//             actions: <Widget>[
//               CupertinoDialogAction(
//                 child: const Text('ok'),
//                 onPressed: () {
//                   Navigator.pop(context, 'ok');
//                 },
//               ),
//             ],
//           ),
//         );
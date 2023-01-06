import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/business_logic/cart_page_controller.dart';
import 'package:restaurant_app/data/models/food_item.dart';
import 'package:restaurant_app/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  testWidgets('enter M letter in search bar', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Tap the search icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // find serch bar
    final searchTextField = find.byKey(Key('searchTextField'));
    expect(searchTextField, findsOneWidget);
    await tester.enterText(searchTextField, 'm');

    // Build the widget until the dismiss animation ends.
    await tester.pumpAndSettle();

    // Verify that our counter has incremented.
    expect(find.text('M'), findsNothing);
  });
}

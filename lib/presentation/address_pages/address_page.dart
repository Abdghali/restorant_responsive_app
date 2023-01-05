import 'package:flutter/material.dart';
import 'package:restaurant_app/business_logic/address_page_controller.dart';
import '../responsive_layout.dart';
import 'address_desktop_page.dart';
import 'address_mobile_page.dart';
import 'address_tablet_page.dart';
import 'package:get/get.dart';

class AddressPage extends StatelessWidget {
  AddressPage({Key? key}) : super(key: key);
  AddressPageController _addressPageController =
      Get.put(AddressPageController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody:
          AddressMobilePage(addressPageController: _addressPageController),
      tabletBody:
          AddressTabletPage(addressPageController: _addressPageController),
      desktopBody:
          AddressDesktopPage(addressPageController: _addressPageController),
    );
  }
}

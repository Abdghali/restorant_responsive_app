import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:restaurant_app/presentation/address_pages/widgets/material_text_form_field.dart';

import '../../business_logic/address_page_controller.dart';
import '../../utility/my_app_color.dart';

class AddressDesktopPage extends StatefulWidget {
  AddressPageController addressPageController;
  AddressDesktopPage({Key? key, required this.addressPageController})
      : super(key: key);

  @override
  State<AddressDesktopPage> createState() => _AddressDesktopPageState();
}

class _AddressDesktopPageState extends State<AddressDesktopPage> {
  final formKey = GlobalKey<FormState>();

  nullValidator(value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid $fieldName';
    } else {
      return null;
    }
  }

  String? emailValidator(String? email) {
    if (email != null && !EmailValidator.validate(email)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyAppColors.backgroundColor,
        body: Container(
          width: double.infinity.w,
          height: double.infinity.h,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://media.istockphoto.com/id/1018141890/photo/two-empty-wine-glasses-sitting-in-a-restaurant-on-a-warm-sunny-afternoon.jpg?s=612x612&w=0&k=20&c=OccJv1oKWSTDqJ6Irw7iW1NEbL0muU2ylqP3EOhOyEg='),
                  fit: BoxFit.cover)),
          child: Center(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.white,
                          MyAppColors.PrimaryColor.withOpacity(0.8),
                        ],
                      )),
                  height: 400.h,
                  width: 200.w,
                  child: Form(
                    key: formKey,
                    child: Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Contact Info",
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    MaterialTextFormFeild(
                                        hintText: 'Name',
                                        suffixText: 'Name',
                                        validator: (value) =>
                                            nullValidator(value, 'Name'),
                                        textInputType: TextInputType.text,
                                        onChanged: (name) {
                                          widget.addressPageController
                                              .setName(name);
                                        }),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    MaterialTextFormFeild(
                                        hintText: 'Email',
                                        suffixText: 'Email',
                                        validator: emailValidator,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        onChanged: (email) {
                                          widget.addressPageController
                                              .setEmail(email);
                                        }),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    MaterialTextFormFeild(
                                        hintText: 'Phone number',
                                        suffixText: 'Phone number',
                                        helperText: "ex. +970582658394",
                                        validator: (value) => nullValidator(
                                            value, 'Phone number'),
                                        textInputType: TextInputType.phone,
                                        onChanged: (phoneNumber) {
                                          widget.addressPageController
                                              .setPhoneNumber(phoneNumber);
                                        }),
                                  ],
                                )),
                                const VerticalDivider(
                                  thickness: 1,
                                ),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Address",
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    MaterialTextFormFeild(
                                        hintText: 'Country',
                                        suffixText: 'Country',
                                        validator: (country) =>
                                            nullValidator(country, 'country'),
                                        textInputType: TextInputType.text,
                                        onChanged: (country) {
                                          widget.addressPageController
                                              .setCountry(country);
                                        }),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    MaterialTextFormFeild(
                                        hintText: 'City',
                                        suffixText: 'City',
                                        validator: (city) =>
                                            nullValidator(city, 'city'),
                                        textInputType: TextInputType.text,
                                        onChanged: (city) {
                                          widget.addressPageController
                                              .setCity(city);
                                        }),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    MaterialTextFormFeild(
                                        hintText: 'Street',
                                        suffixText: 'Street',
                                        validator: (street) =>
                                            nullValidator(street, 'street'),
                                        textInputType: TextInputType.text,
                                        onChanged: (street) {
                                          widget.addressPageController
                                              .setStreet(street);
                                        }),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    MaterialTextFormFeild(
                                        hintText: 'Post code',
                                        suffixText: 'Post code',
                                        validator: (street) =>
                                            nullValidator(street, 'Post code'),
                                        textInputType: TextInputType.number,
                                        onChanged: (postCode) {
                                          widget.addressPageController
                                              .setPostCode(postCode);
                                        }),
                                  ],
                                )),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    final formState = formKey.currentState;

                                    if (formState!.validate()) {
                                      // show daialoge (yes or no) and store the order in Dtabase
                                      widget.addressPageController
                                          .submitOrder();
                                    }
                                  },
                                  child: Text('Submit Order'),
                                  style: ElevatedButton.styleFrom(
                                    primary: MyAppColors.PrimaryColor,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))),
        ));
  }
}

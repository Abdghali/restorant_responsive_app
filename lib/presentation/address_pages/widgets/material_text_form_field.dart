import 'package:flutter/material.dart';
import 'package:restaurant_app/utility/my_app_color.dart';

class MaterialTextFormFeild extends StatelessWidget {
  String? hintText;
  String? helperText;
  String? suffixText;
  TextInputType? textInputType;
  Function(String?)? validator;
  Function(String)? onChanged;
  MaterialTextFormFeild(
      {Key? key,
      this.hintText = '',
      this.helperText,
      this.suffixText,
      this.validator,
      this.textInputType,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) => validator!(value!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.5),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 229, 150, 105)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        suffixText: suffixText,
        helperText: helperText,
        hintText: hintText,
      ),
    );
  }
}

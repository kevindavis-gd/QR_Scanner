import 'package:flutter/material.dart';
import 'package:qr_scanner/Global.dart';

// standardized text field widget
class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;
  final TextEditingController Controller = TextEditingController();

//constructor for class
  TextFieldWidget(
      {this.hintText,
      this.prefixIconData,
      this.suffixIconData,
      this.obscureText,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:Controller,
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(
        color: Global().textColor1,
        fontSize: 14.0,
      ),
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(prefixIconData, size: 18, color: Global().textColor1),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Global().textColor1)),
        suffixIcon: Icon(
          suffixIconData,
          size: 18,
          color: Global().textColor1,
        ),
        labelStyle: TextStyle(color: Global().textColor1),
        focusColor: Global().textColor1,
      ),
    );
  }
  TextEditingController getText()
  {
    return Controller;
  }
}

import 'package:adani/Utils/Styles.dart';
import 'package:flutter/material.dart';


InputDecoration inputDecoration(BuildContext context, { String? hint}) {
  return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: grey, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: grey, width: 2.0),
      ),
      filled: true,
      fillColor:Colors.transparent,
      hintText: hint,
      hintStyle:  greytext,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 2,color: grey),gapPadding: 0)
  );
}
InputDecoration dropinputDecoration(BuildContext context, {Widget? prefixIcon, String? hint,suffixIcon}) {
  return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.all(5),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3),
        borderSide: BorderSide(color: grey_400, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3),
        borderSide: BorderSide(color: grey_400, width: 1.0),
      ),
      filled: true,
      fillColor:white,
      hintText: hint,
      hintStyle:  greytext,
      border: OutlineInputBorder(borderSide: BorderSide(width: 1,color:grey_400),gapPadding: 0)
  );
}


String capitalize(String value) {
  var result = value[0].toUpperCase();
  bool cap = true;
  for (int i = 1; i < value.length; i++) {
    if (value[i - 1] == " " && cap == true) {
      result = result + value[i].toUpperCase();
    } else {
      result = result + value[i];
      cap = false;
    }
  }
  return result;
}
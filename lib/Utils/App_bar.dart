import 'package:flutter/material.dart';

import 'Styles.dart';

class Appbar {
  getAppbar(context, name) {
    return
      AppBar(
        iconTheme: const IconThemeData(color: black),
        title: Text("$name",style: appbartitle,),
        backgroundColor: const Color(0xFFF8F5F5),
        // titleSpacing: 25,
        elevation: 1,
      );

  }
}

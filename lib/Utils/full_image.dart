import 'dart:convert';
import 'package:adani/controllar/data_manager.dart';
import 'package:flutter/material.dart';

class FullImageScreen extends StatelessWidget {
  String? url;
  int? status;



  FullImageScreen({super.key, required this.url, required this.status});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: 'imageHero',
            child: status == 0 ?
            Image.memory(base64Decode(url!),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,):
            Image.network('${DataManager.getInstance().getInspectedFileUrl()}$url',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
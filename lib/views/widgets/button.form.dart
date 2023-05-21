// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/main_pages/history_page.dart';
import 'package:tubes_app/views/main_pages/home_page.dart';
import 'package:tubes_app/views/auth/login_page.dart';
import 'package:tubes_app/views/auth/register_page.dart';

class ButtonForm extends StatelessWidget {
  ButtonForm({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 55,
      decoration: BoxDecoration(
          color: HexColor("#202441"),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
            ),
          ]),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

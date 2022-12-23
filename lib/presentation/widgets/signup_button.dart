import 'package:flutter/material.dart';

Widget colorButton(BuildContext context, String buttonName) {
  return Container(
    width: MediaQuery.of(context).size.width - 90,
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        colors: [
          Color(0xfffd746c),
          Color(0xffff9868),
          Color(0xfffd746c),
        ],
      ),
    ),
    child: Center(
      child: Text(
        buttonName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    ),
  );
}

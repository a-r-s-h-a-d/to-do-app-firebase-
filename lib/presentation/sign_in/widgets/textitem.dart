import 'package:flutter/material.dart';

Widget textItem(BuildContext context, String labelText,
    TextEditingController controller, bool isobscure) {
  return SizedBox(
    width: MediaQuery.of(context).size.width - 70,
    height: 55,
    child: TextFormField(
      controller: controller,
      obscureText: isobscure,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.amber,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpButton extends StatelessWidget {
  final String imagePath;
  final String buttonName;
  final double size;

  const SignUpButton({
    required this.imagePath,
    required this.buttonName,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 60,
      height: 60,
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              width: 1,
              color: Colors.grey,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              height: size,
              width: size,
            ),
            const SizedBox(width: 25),
            Text(
              buttonName,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key,
  required this.onpressed,
  required this.text,
  this.width = double.infinity});

  final VoidCallback onpressed;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        style: TextButton.styleFrom(fixedSize: Size(width, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius/2)
        )),
        onPressed: onpressed,
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,style: Theme.of(context).textTheme.button,)
        ],),
      ),
    );
  }
}

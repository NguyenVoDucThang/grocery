import 'package:flutter/material.dart';
import 'package:kid_shop/core/constants/app_colors.dart';
import 'package:kid_shop/core/constants/app_style.dart';

class CommonButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const CommonButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.primaryGreen),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide.none,
            ),
          ),
        ),
        onPressed: () => onPressed(),
        child: Text(
          text,
          style: AppStyle.h4(),
        ),
      ),
    );
  }
}

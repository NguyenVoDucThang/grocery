import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kid_shop/core/constants/app_style.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Function() onTap;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Image.asset(
            imageUrl,
            height: 50.h,
          ),
          onTap: () => onTap(),
        ),
        Text(
          title,
          style: AppStyle.h3(),
        )
      ],
    );
  }
}

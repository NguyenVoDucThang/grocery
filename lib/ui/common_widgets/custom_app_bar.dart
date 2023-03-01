import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Function()? getBack;

  const CustomAppBar({
    Key? key,
    required this.appBar,
    this.title,
    this.leading,
    this.actions,
    this.getBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: title,
      actions: actions,
      leading: leading ?? IconButton(
        onPressed: () => getBack == null ? Get.back() : getBack!(),
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.primaryGreen,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

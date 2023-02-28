import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final ValueNotifier<bool> controller;
  final Function() onTapFavorite;
  const FavoriteButton({
    Key? key,
    required this.controller,
    required this.onTapFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
        valueListenable: controller,
        builder: (_,bool value, __) {
          return InkWell(
            child: Icon(
              value ? Icons.favorite : Icons.favorite_border_outlined,
              color: Colors.grey,
              size: 18,
            ),
            onTap: () async {
              controller.value = !controller.value;
              await onTapFavorite();
            },
          );
        });
  }
}

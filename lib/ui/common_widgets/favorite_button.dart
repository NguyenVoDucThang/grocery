import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final Function() onTapFavorite;

  const FavoriteButton({
    Key? key,
    required this.isFavorite,
    required this.onTapFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: Colors.grey,
        size: 18,
      ),
      onTap: () => onTapFavorite(),
    );
  }
}

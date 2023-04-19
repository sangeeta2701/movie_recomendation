import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/genre.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key,required this.genre,required this.onTap});

  final Genere genre;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Material(
        color: genre.isSelected? Theme.of(context).colorScheme.primary:Colors.transparent,
        borderRadius: BorderRadius.circular(kBorderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(kBorderRadius),
          onTap: onTap,
          child: Container(
            width: 140,
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
            child: Text(genre.name,
            textAlign: TextAlign.center,),
          ),
        ),
      ),
    );
  }
}

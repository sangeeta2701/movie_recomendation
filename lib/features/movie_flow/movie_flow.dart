import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/genre_screen.dart';
import 'package:movie_recommendation_app/features/movie_flow/landing/landing_screen.dart';
import 'package:movie_recommendation_app/features/movie_flow/rating/rating_screen.dart';
import 'package:movie_recommendation_app/features/years_back/years_back_screen.dart';

class MovieFlow extends StatefulWidget {
  const MovieFlow({super.key});

  @override
  State<MovieFlow> createState() => _MovieFlowState();
}

class _MovieFlowState extends State<MovieFlow> {
  final pageController = PageController();

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(microseconds: 600),
        curve: Curves.easeInOutCubic);
  }

  void previpusPage() {
    pageController.previousPage(
        duration: const Duration(microseconds: 600),
        curve: Curves.easeInOutCubic);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        LandingScreen(nextPage: nextPage,previousPage: previpusPage,),
        GenreScreen(nextPage: nextPage,previousPage: previpusPage,),
        RatingScreen(nextPage: nextPage,previousPage: previpusPage,),
        YearsBackScreen(nextPage: nextPage,previousPage: previpusPage,),
      ],
    );
  }
}

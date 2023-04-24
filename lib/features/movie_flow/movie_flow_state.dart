import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/genre.dart';
import 'package:movie_recommendation_app/features/movie_flow/result/movie.dart';

const movieMock = Movie(
    title: "The Hulk",
    overview:
        "Bruce Banner, a genetics with a tragic past,sufferes an accident that causes him to transform into a raging green monster when he gets angry.",
    voteAverage: 4.8,
    genres: [
      Genere(name: "Action"),
      Genere(name: "Fantasy"),
    ],
    releaseDate: "2019-05-24",
    backdropPath: "",
    posterPath: "");

const genresMock = [
  Genere(name: "Action"),
  Genere(name: "Comedy"),
  Genere(name: "Horror"),
  Genere(name: "Anime"),
  Genere(name: "Drama"),
  Genere(name: "Family"),
  Genere(name: "Romance"),
];

@immutable
class MovieFlowState {
  final PageController pageController;
  final int rating;
  final int yearsBack;
  final List<Genere> genres;
  final Movie movie;

  const MovieFlowState({
    required this.pageController,
    this.movie = movieMock,
    this.genres = genresMock,
    this.rating = 5,
    this.yearsBack = 10,
  });

  MovieFlowState copyWith({
    PageController? pageController,
    int? rating,
    int? yearsBack,
    List<Genere>? grnres,
    Movie? movie,
  }) {
    return MovieFlowState(
        pageController: pageController ?? this.pageController,
        rating: rating ?? this.rating,
        yearsBack: yearsBack ?? this.yearsBack,
        genres: genres,
        movie: movie ?? this.movie);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieFlowState &&
        other.pageController == pageController &&
        other.rating == rating &&
        other.yearsBack == yearsBack &&
        other.genres == genres &&
        other.movie == movie;
  }

  @override
  int get hashCode {
    return pageController.hashCode ^
        rating.hashCode ^
        yearsBack.hashCode ^
        genres.hashCode ^
        movie.hashCode;
  }
}

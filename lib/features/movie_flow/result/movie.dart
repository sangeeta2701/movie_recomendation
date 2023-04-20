import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/genre.dart';

@immutable
class Movie {
  final String title;
  final String overview;
  final num voteAverage;
  final List<Genere> genres;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  const Movie({
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.genres,
    required this.releaseDate,
    required this.backdropPath,
    required this.posterPath,
  });

  Movie.initial()
      : title = " ",
        overview = " ",
        voteAverage = 0,
        genres = [],
        releaseDate = " ",
        backdropPath = "",
        posterPath = "";

  String get genresCommaSeprated => genres.map((e) => e.name).toList().join();

  @override
  String toString() {
    return 'Movie(title: $title, overview: $overview, voteAverage: $voteAverage, genres: $genres, releaseDate: $releaseDate, backdropPath: $backdropPath, posterPath: $posterPath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.title == title &&
        other.overview == override &&
        other.voteAverage == voteAverage &&
        listEquals(other.genres, genres) &&
        other.releaseDate == releaseDate;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        overview.hashCode ^
        voteAverage.hashCode ^
        genres.hashCode ^
        releaseDate.hashCode;
  }
}

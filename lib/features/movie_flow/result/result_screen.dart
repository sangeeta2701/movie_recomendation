
import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/genre.dart';
import 'package:movie_recommendation_app/features/movie_flow/result/movie.dart';

class ResultScreen extends StatelessWidget {
  static route({bool fullScreenDialog = true}) =>
      MaterialPageRoute(builder: (context) => ResultScreen());
  ResultScreen({super.key});

  final double movieHeight = 150;
  final movie = Movie(
      title: "The Hulk",
      overview: "Bruce Banner, a genetics with a tragic past,sufferes an accident that causes him to transform into a raging green monster when he gets angry.",
      voteAverage: 4.8,
      genres: [
        Genere(name: "Action"),
        Genere(name: "Fantasy"),
      ],
      releaseDate: "2019-05-24",
      backdropPath: "",
      posterPath: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
            child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CoverImage(),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: -(movieHeight / 2),
                  child:
                      MovieImageDetails(movie: movie, movieHeight: movieHeight),
                )
              ],
            ),
            SizedBox(
              height: movieHeight / 2,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                movie.overview,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            )
          ],
        )),
        PrimaryButton(
            onpressed: () {
              Navigator.pop(context);
            },
            text: "Find another movie"),
        SizedBox(
          height: kMediumSpacing,
        ),
      ]),
    );
  }
}

class CoverImage extends StatelessWidget {
  const CoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 298),
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Colors.transparent,
              ]).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: Placeholder(),
      ),
    );
  }
}

class MovieImageDetails extends StatelessWidget {
  const MovieImageDetails(
      {super.key, required this.movieHeight, required this.movie});
  final double movieHeight;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: movieHeight,
            child: Placeholder(),
          ),
          SizedBox(
            width: kMediumSpacing,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: theme.textTheme.headline6,
              ),
              Text(
                movie.genresCommaSeprated,
                style: theme.textTheme.bodyText2,
              ),
              Row(
                children: [
                  Text(
                    "4.8",
                    style: theme.textTheme.bodyText2?.copyWith(
                        color: theme.textTheme.bodyText2?.color
                            ?.withOpacity(0.62)),
                  ),
                  Icon(
                    Icons.star_rounded,
                    size: 20,
                    color: Colors.amber,
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

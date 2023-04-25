import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/list_card.dart';
import 'package:movie_recommendation_app/features/movie_flow/movie_flow_controller.dart';

class GenreScreen extends ConsumerWidget {
 
  const GenreScreen(
      {super.key, });
 
  // List<Genere> genres = [
  //   Genere(name: "Action"),
  //   Genere(name: "Comedy"),
  //   Genere(name: "Horror"),
  //   Genere(name: "Anime"),
  //   Genere(name: "Drama"),
  //   Genere(name: "Family"),
  //   Genere(name: "Romance"),];

  // void toggleSelected(Genere genere) {
  //   List<Genere> updatedGenres = [
  //     for (final oldGenre in genres)
  //       if (oldGenre == genere) oldGenre.toggleSelected() else oldGenre
  //   ];
  //   setState(() {
  //     genres = updatedGenres;
  //   });
  // }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:ref.read(movieFlowControllerProvider.notifier).previousPage,
        ),
      ),
      body: Center(
        child: Column(children: [
          Text("Let's start with a genre",
          style: theme.textTheme.headline5,
          textAlign: TextAlign.center,),
          Expanded(child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: kListItemSpacing),
            itemBuilder: (context,index){
              final genre =ref.watch(movieFlowControllerProvider). genres[index];
              return ListCard(genre: genre, onTap: (){
                ref.read(movieFlowControllerProvider.notifier).toggleSelected(genre);
              });
            }, separatorBuilder: (context, index) {
            return SizedBox(height: kMediumSpacing,); 
          }, itemCount: ref.watch(movieFlowControllerProvider).genres.length),),



          PrimaryButton(onpressed: ref.read(movieFlowControllerProvider.notifier).nextPage, text: "Continue"),
          SizedBox(height: kMediumSpacing,),
        ]),
      ),
    );
  }
}

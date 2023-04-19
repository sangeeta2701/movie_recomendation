import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/genre.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/list_card.dart';

class GenreScreen extends StatefulWidget {
  final VoidCallback nextPage;
  final VoidCallback previousPage;
  const GenreScreen(
      {super.key, required this.nextPage, required this.previousPage});
  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<Genere> genres = [
    Genere(name: "Action"),
    Genere(name: "Comedy"),
    Genere(name: "Horror"),
    Genere(name: "Anime"),
    Genere(name: "Drama"),
    Genere(name: "Family"),
    Genere(name: "Romance"),];

  void toggleSelected(Genere genere) {
    List<Genere> updatedGenres = [
      for (final oldGenre in genres)
        if (oldGenre == genere) oldGenre.toggleSelected() else oldGenre
    ];
    setState(() {
      genres = updatedGenres;
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:widget.previousPage,
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
              final genre = genres[index];
              return ListCard(genre: genre, onTap: (){
                toggleSelected(genre);
              });
            }, separatorBuilder: (context, index) {
            return SizedBox(height: kMediumSpacing,); 
          }, itemCount: genres.length),),



          PrimaryButton(onpressed: widget.nextPage, text: "Continue"),
          SizedBox(height: kMediumSpacing,),
        ]),
      ),
    );
  }
}

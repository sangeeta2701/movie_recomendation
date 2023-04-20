import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen(
      {super.key, required this.nextPage, required this.previousPage});
  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 5;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Select a minimum rating from 1-10",
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${rating.ceil()}",
                  style: theme.textTheme.headline2,
                ),
                Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 62,
                )
              ],
            ),
            Spacer(),
            Slider(
            
                value: rating,
                max: 10,
                min: 1, 
                divisions: 10,
                label: "${rating.ceil()}",
                onChanged: (value) {
                  setState(() {
                    rating = value;
                  });
                }),
                Spacer(),
                PrimaryButton(onpressed: widget.nextPage, text: "Yes Please"),
                SizedBox(height: kMediumSpacing,),
          ],
        ),
      ),
    );
  }
}

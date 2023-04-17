import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key,required this.nextPage,required this.previousPage});
  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          Text("Let's find a movie",style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,),
          Spacer(),
          Image.asset("images/img1.png"),
          Spacer(),
          PrimaryButton(onpressed: nextPage, text: "Get Started"),
          SizedBox(height: kMediumSpacing,),
        ],),
      ),
    );
  }
}

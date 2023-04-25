import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';
import 'package:movie_recommendation_app/features/movie_flow/movie_flow_controller.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key,});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          Text("Let's find a movie",style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,),
          Spacer(),
          Image.asset("images/img1.png"),
          Spacer(),
          PrimaryButton(onpressed: ref.read(movieFlowControllerProvider.notifier).nextPage, text: "Get Started"),
          SizedBox(height: kMediumSpacing,),
        ],),
      ),
    );
  }
}

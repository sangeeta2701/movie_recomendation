import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';
import 'package:movie_recommendation_app/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_recommendation_app/features/movie_flow/result/result_screen.dart';

class YearsBackScreen extends ConsumerWidget {
  const YearsBackScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:
              ref.read(movieFlowControllerProvider.notifier).previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "How many years back should we check for?",
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${ref.watch(movieFlowControllerProvider).yearsBack}",
                  style: theme.textTheme.headline2,
                ),
                Text(
                  "Years Back",
                  style: theme.textTheme.headline4?.copyWith(
                    color: theme.textTheme.headline4?.color?.withOpacity(0.62),
                  ),
                )
              ],
            ),
            Spacer(),
            Slider(
                max: 70,
                min: 0,
                divisions: 70,
                label: "${ref.watch(movieFlowControllerProvider).yearsBack}",
                value: ref.watch(movieFlowControllerProvider).yearsBack.toDouble(),
                onChanged: (value) {
                  ref
                      .read(movieFlowControllerProvider.notifier)
                      .updateYearsBack(value.toInt());
                }),
            Spacer(),
            PrimaryButton(
                onpressed: () {
                  Navigator.of(context).push(ResultScreen.route());
                },
                text: "Amazing"),
            SizedBox(
              height: kMediumSpacing,
            )
          ],
        ),
      ),
    );
  }
}

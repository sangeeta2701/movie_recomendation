import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';
import 'package:movie_recommendation_app/features/movie_flow/movie_flow_controller.dart';

class RatingScreen extends ConsumerWidget {
  const RatingScreen({
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
              "Select a minimum rating from 1-10",
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${ref.watch(movieFlowControllerProvider).rating}",
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
                value: ref.watch(movieFlowControllerProvider).rating.toDouble(),
                max: 10,
                min: 1,
                divisions: 10,
                label: "${ref.watch(movieFlowControllerProvider).rating}",
                onChanged: (value) {
                  ref
                      .read(movieFlowControllerProvider.notifier)
                      .updateRating(value.toInt());
                }),
            Spacer(),
            PrimaryButton(onpressed: ref.read(movieFlowControllerProvider.notifier).nextPage, text: "Yes Please"),
            SizedBox(
              height: kMediumSpacing,
            ),
          ],
        ),
      ),
    );
  }
}

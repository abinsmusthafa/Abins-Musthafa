import 'package:flutter/material.dart';
import 'package:flutter_profile/components/animated_progress_indicator.dart';

import '../../../constants.dart';

class Coding extends StatelessWidget {
  const Coding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Other Skills",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.7,
          label: "Dart",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.75,
          label: "GetX",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.8,
          label: "Google map Library",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.75,
          label: "Geolocator Library",
        ),

        AnimatedLinearProgressIndicator(
          percentage: 0.8,
          label: "JSON/REST API",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.75,
          label: "GitHub, Sourcetree ",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.85,
          label: "App Store Build release",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.7,
          label: "Play Store Build release",
        ), AnimatedLinearProgressIndicator(
          percentage: 0.75,
          label: "Testing and maintenance",
        ),
      ],
    );
  }
}

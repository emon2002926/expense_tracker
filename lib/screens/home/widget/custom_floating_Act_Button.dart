import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomFloatingActButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomFloatingActButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onPressed!();
      },
      shape: const CircleBorder(),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.tertiary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ],
            transform: GradientRotation(pi / 4),
          ),
        ),
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}

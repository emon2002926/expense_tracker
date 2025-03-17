import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'genaral_textview.dart';
class WelcomeTab extends StatelessWidget {
  final String name;
  const WelcomeTab({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow[700]),
                ),
                Icon(
                  CupertinoIcons.person_fill,
                  color: Colors.grey[200],
                )
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GeneralTextview(
                  text: "Welcome",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.outline,
                ),
                GeneralTextview(
                  text: name,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                )
              ],
            ),
          ],
        ),
        IconButton(
            onPressed: () {}, icon: Icon(CupertinoIcons.settings))
      ],
    );
  }
}

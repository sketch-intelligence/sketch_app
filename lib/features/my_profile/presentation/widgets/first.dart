import 'package:flutter/material.dart';

import 'package:sketch/features/my_profile/presentation/widgets/second.dart';




class MyProfileFirstSection extends StatelessWidget {
  const MyProfileFirstSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            const SizedBox(height: 8),
            Text(
              'Jena',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Photographer, travelholic, food lover',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MyProfileSecondSection(),
            ),
            SizedBox(height: 16),
          ],
        );
  }
}
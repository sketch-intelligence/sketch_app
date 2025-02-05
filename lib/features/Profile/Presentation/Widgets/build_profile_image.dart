import 'package:flutter/material.dart';

Widget buildProfilePicture(BuildContext context) {
  double radius =
      MediaQuery.of(context).size.width * 0.15; // 15% of screen width
  return CircleAvatar(
    radius: radius,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: const NetworkImage(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg/800px-Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg",
    ),
  );
}

import 'package:flutter/material.dart';

Widget buildCoverImage(BuildContext context) {
  double height =
      MediaQuery.of(context).size.height * 0.25; // 25% of screen height
  return Container(
    color: Colors.grey,
    child: Image.network(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg/800px-Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg",
      width: double.infinity,
      height: height,
      fit: BoxFit.cover,
    ),
  );
}

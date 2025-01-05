  import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';


  class buildMessageInput extends StatelessWidget {
  const buildMessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Icons before the TextField
          Row(
            children: [
              SvgPicture.asset(Assets.imagesShareNetwork),
              SizedBox(width: 8.0), 
              SvgPicture.asset(Assets.imagesSmiley),
              SizedBox(width: 8.0), 
              SvgPicture.asset(Assets.imagesImage59)
            ],
          ),
          SizedBox(width: 8.0), // Space between icons and TextField
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  borderSide: BorderSide.none, // Remove border line
                ),
                filled: true,
                fillColor: Colors.grey[200], // Match the background color
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0), // Adjust padding
              ),
            ),
          ),
          SizedBox(width: 8.0), // Space between TextField and IconButton
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue, // Change this to your desired color
            ),
            child: IconButton(
              icon: Icon(Icons.send, color: Colors.white), // White icon color
              onPressed: () {
                // Handle sending message logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}

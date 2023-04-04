import 'package:flutter/material.dart';

class VideoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Video content goes here
          // You can use any video player plugin or widget to display the video
          // For example, you can use the video_player package:
          // https://pub.dev/packages/video_player
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            // height: 300,
            child: Center(
              child: Text('Video content'),
            ),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.black)
            ),
          ),
          // Like and comment buttons
          Container(
            margin: EdgeInsets.only(bottom: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                    // Handle like button press
                  },
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.comment),
                  onPressed: () {
                    // Handle comment button press
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
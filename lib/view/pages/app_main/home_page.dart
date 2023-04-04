import 'package:flutter/material.dart';
import 'package:reelant_1/view/pages/app_main/profile_page.dart';
import 'package:reelant_1/view/pages/app_main/search_page.dart';

import 'discover_tab.dart';
import 'inbox_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeTab(),
    DiscoverTab(),
    InboxTab(),
    SearchTab(),
    UserProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: Container(),
          leadingWidth: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('ReeLant'),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed, // Fixed
          backgroundColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class HomeTab extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        children: [
          VideoItem(),
          VideoItem(),
          VideoItem(),
          // Add as many VideoItem widgets as you want
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0, // Home tab is selected by default
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.explore),
      //       label: 'Discover',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.message),
      //       label: 'Inbox',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      //   onTap: (int index) {
      //     _pageController.animateToPage(
      //       0, // Always go back to the first page
      //       duration: const Duration(milliseconds: 300),
      //       curve: Curves.easeInOut,
      //     );
      //   },
      // ),
    );
  }
}

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
                border: Border.all(color: Colors.black)),
          ),
          // Username and description
          Positioned(
            left: 1,
            bottom: 1,
            child: Container(
              margin: EdgeInsets.only(left: 20, bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
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










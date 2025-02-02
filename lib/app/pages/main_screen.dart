import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/pages/camera/camera_screen.dart';
import 'package:flutter_new_instagram/app/pages/container/home_container_screen.dart';
import 'package:flutter_new_instagram/app/pages/message/message_screen.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  static const String routeName = '/main';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => MainScreen());
  }

  PageController _pageController = PageController(initialPage: 1);
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          currentIndex = index;
        },
        children: [CameraScreen([]), HomeContainerScreen(), MessageScreen()],
      ),
      onWillPop: () async {
        if (currentIndex == 0) {
          _pageController.animateToPage(1,
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          return false;
        }
        return true;
      },
    );
  }
}

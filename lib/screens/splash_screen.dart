/*
1. check for the enquiry status api
2. if status: 0 sitback screen
3. else status: 1 => than we need to check for is already login or not
 if not login need to show existing user screen else
4. Need to check for evaluation status(EVAL_STATUS) which will be stored when user login
if already login we will get from local storage else its null
5. if eval status is there than we are showing dashboard screen else evaluation screen

API's used in this screen:
1. EnquiryStatus API
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gwc_success_team/screens/login_screen/success_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/background_widget.dart';
import 'bottom_bar/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  String loginStatus = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      loginStatus = preferences.getString("token")!;
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
    startTimer();
  }

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 1) {
        _currentPage++;
      } else {
        _currentPage = 1;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            reverse: false,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: <Widget>[
              splashImage(),
              (loginStatus.isNotEmpty)
                  ? const DashboardScreen()
                  : const SuccessLogin(),
            ],
          ),
        ],
      ),
    );
  }

  splashImage() {
    return const BackgroundWidget(
      assetName: 'assets/images/splash_bg.png',
      child: Center(
        child: Image(
          image: AssetImage("assets/images/Gut wellness logo green.png"),
        ),
      ),
    );
  }
}

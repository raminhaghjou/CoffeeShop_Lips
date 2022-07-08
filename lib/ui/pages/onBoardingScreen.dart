import 'package:coffeelips/ui/pages/pages.dart';
import 'package:flutter/material.dart';
// import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatelessWidget {
  final pages = [
    PageViewModel(
      pageColor: Color(0xFF514648),
      bubbleBackgroundColor: Colors.white,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
            'Amazing coffee',
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
          ),
          Text(
            'Introduce your coffee information, anytime, anywhere.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/home-1-slider.jpg',
        width: 370.0,
        height: 950.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xFFF27E21),
      iconColor: null,
      bubbleBackgroundColor: Colors.white,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('Cute and Yummy',
              style:
                  TextStyle(fontWeight: FontWeight.w900, color: Colors.white)),
          Text(
            'Bets cup of coffee I have found in Washington',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/landing-slider.png',
        width: 370,
        height: 800.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Colors.green,
      iconColor: null,
      bubbleBackgroundColor: Colors.white,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('Coffee Lips',
              style:
                  TextStyle(fontWeight: FontWeight.w900, color: Colors.white)),
          Text(
            'We take our coffee drinking very seriously.',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/coffee.png',
        width: 370.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IntroViewsFlutter(
              pages,
              onTapDoneButton: () async {
                SharedPreferences _prefs =
                    await SharedPreferences.getInstance();

                var uid = _prefs.getString("uid");
                var type = _prefs.getString("type");

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Wrapper()));

                if (uid != null && uid != '') {
                  // if (type == "doctor") {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Wrapper()));
                  // }
                  // else {
                  //   Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => ProfilePage(uid: uid)));
                }
                // } else {
                //   Navigator.pushNamed(context, "landingpage");
                // }
              },
              showSkipButton: false,
              doneText: Text(
                "Get Started",
              ),
              pageButtonsColor: Colors.white,
              pageButtonTextStyles: new TextStyle(
                // color: Colors.indigo,
                fontSize: 16.0,
                fontFamily: "Regular",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

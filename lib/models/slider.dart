import 'package:coffeelips/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;
  final String skipBtn;

  Slider(
      {@required this.sliderImageUrl,
      @required this.sliderHeading,
      @required this.sliderSubHeading,
      this.skipBtn});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'assets/images/slider_image_1.png',
      sliderHeading: Constants.SLIDER_HEADING_1,
      sliderSubHeading: Constants.SLIDER_DESC,
      skipBtn: Constants.SKIP),
  Slider(
      sliderImageUrl: 'assets/images/wallpaper.jpg',
      sliderHeading: Constants.SLIDER_HEADING_2,
      sliderSubHeading: Constants.SLIDER_DESC,
      skipBtn: Constants.SKIP),
  Slider(
      sliderImageUrl: 'assets/images/slider_image_3.png',
      sliderHeading: Constants.SLIDER_HEADING_3,
      sliderSubHeading: Constants.SLIDER_DESC,
      skipBtn: ""),
];

part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = "405A39".toColor();
Color yellowColor = "FFC700".toColor();
Color greyColor = "8D92A3".toColor();
Color blackColor = "020202".toColor();
Color redColor = "D9435E".toColor();

TextStyle headerStyle =
    GoogleFonts.poppins().copyWith(fontSize: 20, fontWeight: FontWeight.w500);
TextStyle subHeaderStyle = GoogleFonts.poppins()
    .copyWith(color: greyColor, fontWeight: FontWeight.w300);
TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: blackColor, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: blackColor, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(color: blackColor);
TextStyle whiteFontStyle = GoogleFonts.poppins().copyWith(color: Colors.white);
TextStyle redFontStyle = GoogleFonts.poppins().copyWith(color: redColor);

TextStyle subTitleLightBlackTextAR() {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: Colors.black.withOpacity(0.70),
    height: 1.0,
    fontFamily: 'AcuminProRegular',
  );
}

TextStyle subTitleBlackTextAR() {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: Colors.black,
    height: 1.0,
    fontFamily: 'AcuminProRegular',
  );
}

TextStyle subtitleWhiteTextAR() {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: Colors.white.withOpacity(0.84),
    letterSpacing: 1.0,
    height: 1.0,
    fontFamily: 'AcuminProRegular',
  );
}

TextStyle subtitlePrimaryTextAR() {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: mainColor,
    letterSpacing: 1.0,
    height: 1.0,
    fontFamily: 'AcuminProRegular',
  );
}

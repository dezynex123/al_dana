import 'package:flutter/cupertino.dart';

const Color white = Color(0xffffffff);
const Color black = Color(0xff000000);
const Color lightTextGrey = Color(0xff939393);

const Color bgColor01 = Color(0xff7E3401);
const Color bgColor1 = Color(0xffF3F3F3);
const Color bgColor2 = Color(0xffE7E7E7);
const Color bgColor3 = Color(0xffC4C4C4);
const Color bgColor4 = Color(0xff4F9D7E);
const Color bgColor5 = Color(0xff0081AB);
const Color bgColor6 = Color(0xff666CCD);
const Color bgColor7 = Color(0xff976D03);
const Color bgColor8 = Color(0xff6E2AA3);
const Color bgColor9 = Color(0xff2C7767);
const Color bgColor10 = Color(0xff394077);
const Color bgColor11 = Color(0xff00B083);
const Color bgColor12 = Color(0xffDF704C);
const Color bgColor13 = Color(0xffFFB600);
const Color bgColor14 = Color(0xff00A69C);
const Color bgColor15 = Color(0xff32073F);
const Color bgColor16 = Color(0xffDA5328);
const Color bgColor17 = Color(0xffEFB101);
const Color bgColor18 = Color(0xff9E66B1);
const Color bgColor19 = Color(0xff2291FF);
const Color bgColor20 = Color(0xffE7D7EC);
const Color bgColor21 = Color(0xff0068BD);
const Color bgColor22 = Color(0xff469C7A);
const Color bgColor23 = Color(0xffB6121E);
const Color bgColor24 = Color(0xff00C165);
const Color bgColor25 = Color(0xff222222);
const Color bgColor26 = Color(0xffDADADA);
const Color bgColor27 = Color(0xff003A85);
const Color bgColor28 = Color(0xff018336);
const Color bgColor29 = Color(0xffFF3868);
const Color bgColor30 = Color(0xff06D39E);
const Color bgColor31 = Color(0xff118AB2);
const Color bgColor32 = Color(0xff00BDFE);
const Color bgColor33 = Color(0xffFFD9D6);
const Color bgColor34 = Color(0xffB4FCE9);
const Color bgColor35 = Color(0xffC2DEFF);
const Color bgColor36 = Color(0xffD9D9D9);
const Color bgColor37 = Color(0xff007DA6);
const Color bgColor38 = Color(0xff00B989);

const Color borderColor = Color(0xff909090);

const Color primary = Color(0xff133B87);

const Color accent = Color(0xff00C165);
const Color accent60 = Color(0xff03CB6B);

const Color textColor = Color(0xffFF5B6D);
const Color textColor01 = Color(0xff909090);
const Color textColor02 = Color(0xff909090);
const Color textColor03 = Color(0xff493E3E);
const Color textColor04 = Color(0xffFF0000);
const Color textColor05 = Color(0xff469C7A);
const Color textColor06 = Color(0xffFFB600);
const Color textColor07 = Color(0xff3E91DF);
const Color textColor08 = Color(0xffFF0031);
const Color textColor09 = Color(0xffEE002E);
const Color textColor10 = Color(0xff242424);

const Color textDark = Color(0xff303030);
const Color textDark80 = Color(0xff505050);
const Color textDark70 = Color(0xff878787);
const Color textDark60 = Color(0xff6D6D6D);
const Color textDark50 = Color(0xff808080);
const Color textDark40 = Color(0xff909090);
const Color textDark20 = Color(0xffCACACA);
const Color textDark10 = Color(0xffE7E7E7);

const Color icColor1 = Color(0xffCF4222);
const Color greenAppTheme = Color(0xff53A000);
const Color tileColor = Color(0xffEFF7FF);

Color hexToColor(String code) {
  Color color;
  try {
    color = Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  } catch (e) {
    color = const Color(0xffE7E7E7);
  }

  return color;
}

String colorToHexValue(Color color) {
  String hex = '';
  try {
    String hexString = color.value.toRadixString(16);
    hex = '#${hexString.substring(2, hexString.length)}';
  } catch (e) {
    print(e);
  }
  return hex;
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

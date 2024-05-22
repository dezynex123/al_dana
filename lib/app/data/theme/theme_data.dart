import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme.dart';

class MyTheme {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
      //primaryColor: primary,

      // primaryColor: isDarkTheme ? Colors.black : Color(0xFF4e99f6),
      // primaryColorDark: Color(0xFF003051),
      // accentColor: Colors.deepOrangeAccent,
      // backgroundColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),
      // indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      // buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      // hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xff808080),
      // highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      // hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      // focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      // disabledColor: Colors.black26,
      // cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      // canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      // brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      splashColor: Colors.grey,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.transparent,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
        color: Colors.transparent,
        elevation: 0.0,
      ),
      scaffoldBackgroundColor: white,

      inputDecorationTheme: underlineInputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: const TextSelectionThemeData(),
    );
  }

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

InputDecorationTheme underlineInputDecorationTheme() {
  UnderlineInputBorder underlineInputBorder = const UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(0.0)),
      borderSide: BorderSide(color: textDark40));
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    focusedBorder: underlineInputBorder,
    border: underlineInputBorder,
    enabledBorder: underlineInputBorder,
  );
}

InputDecorationTheme outlineInputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(),
      gapPadding: 10.0);
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    labelStyle: tsPoppins(size: 18.0, opacity: 1.0),
  );
}

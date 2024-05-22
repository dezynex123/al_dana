import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

TextStyle tsPoppins(
        {double size = 12.0,
        double opacity = 1.0,
        FontWeight weight = FontWeight.w500,
        Color color = textDark,
        TextDecoration decoration = TextDecoration.none,
        double? height}) =>
    GoogleFonts.poppins(
      fontSize: size,
      height: height,
      fontWeight: weight,
      color: color.withOpacity(opacity),
      decoration: decoration,
    );

TextStyle tsInter(
        {double size = 12.0,
        double opacity = 1.0,
        FontWeight weight = FontWeight.w500,
        Color color = textDark,
        TextDecoration decoration = TextDecoration.none,
        double? height}) =>
    GoogleFonts.inter(
      fontSize: size,
      height: height,
      fontWeight: weight,
      color: color.withOpacity(opacity),
      decoration: decoration,
    );

TextStyle tsRubik(
        {double size = 12.0,
        double opacity = 1.0,
        FontWeight weight = FontWeight.w500,
        Color color = textDark,
        TextDecoration decoration = TextDecoration.none,
        double? height}) =>
    GoogleFonts.rubik(
      fontSize: size,
      height: height,
      fontWeight: weight,
      color: color.withOpacity(opacity),
      decoration: decoration,
    );

TextStyle tsPoppinsFormLabel(
        {double size = 14.0,
        double opacity = 1.0,
        FontWeight weight = FontWeight.w500,
        Color color = textDark40,
        TextDecoration decoration = TextDecoration.none}) =>
    GoogleFonts.poppins(
      fontSize: size,
      fontWeight: weight,
      color: color.withOpacity(opacity),
      decoration: decoration,
    );

TextStyle tsPoppinsFormTextHInt(
        {double size = 12.0,
        double opacity = 1.0,
        FontWeight weight = FontWeight.w500,
        Color color = textDark80,
        TextDecoration decoration = TextDecoration.none}) =>
    GoogleFonts.poppins(
      fontSize: size,
      fontWeight: weight,
      color: color.withOpacity(opacity),
      decoration: decoration,
    );

class InputFormDecoration {
  static InputDecoration outLinedInputTextDecoration({
    String? labelText,
    String? hintText,
    bool? filled,
    bool? autofocus,
    bool? isDense,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.symmetric(horizontal: 10.0),
    double radius = 8.0,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    TextStyle? textStyle,
    BorderSide borderSide = const BorderSide(color: bgColor3),
    Widget? prefixIcon,
    Widget? suffixIcon,
    Widget? suffix,
    Color? fillColor,
    BoxConstraints? constraints,
    FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.auto,
  }) {
    return InputDecoration(
      contentPadding: contentPadding,
      labelText: labelText,
      constraints: constraints,
      labelStyle: labelStyle,
      hintText: hintText,
      hintStyle: hintStyle,
      isDense: isDense,
      filled: filled,
      floatingLabelBehavior: floatingLabelBehavior,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffix: suffix,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: borderSide),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: borderSide),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: borderSide),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: borderSide),
    );
  }

  static InputDecoration underLinedInputTextDecoration({
    String? labelText,
    String? hintText,
    bool? filled,
    bool? autofocus,
    bool? isDense,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.symmetric(horizontal: 10.0),
    double radius = 8.0,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    TextStyle? textStyle,
    BorderSide borderSide = const BorderSide(color: bgColor3),
    Widget? prefixIcon,
    Widget? sufixIcon,
    Widget? prefix,
    Widget? sufix,
    Color? fillColor,
    BoxConstraints? constraints,
    FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.auto,
  }) {
    return InputDecoration(
      contentPadding: contentPadding,
      labelText: labelText,
      labelStyle: labelStyle,
      hintText: hintText,
      constraints: constraints,
      hintStyle: hintStyle,
      isDense: isDense,
      filled: filled,
      floatingLabelBehavior: floatingLabelBehavior,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      suffixIcon: sufixIcon,
      prefix: prefix,
      suffix: sufix,
      border: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: borderSide),
      focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: borderSide),
      enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: borderSide),
      disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: borderSide),
    );
  }
}

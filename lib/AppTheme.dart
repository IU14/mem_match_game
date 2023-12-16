import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme({
    this.primaryColor = const Color.fromARGB(255, 224, 210, 76),
    this.tertiaryColor = const Color.fromARGB(255, 118, 206, 162),
    this.neutralColor = const Color.fromARGB(139, 228, 227, 219),
  });

  final Color primaryColor, tertiaryColor, neutralColor;

  ThemeData toThemeData() {
    return ThemeData(useMaterial3: true);
  }

  ThemeData _base(ColorScheme colorScheme) {
    final primaryTextTheme = GoogleFonts.heeboTextTheme();
    final secondaryTextTheme = GoogleFonts.cabinTextTheme();
    final textTheme = primaryTextTheme.copyWith(
        displaySmall: secondaryTextTheme.displaySmall);
    return ThemeData(
      textTheme: textTheme,
    );
  }

  @override
  ThemeExtension<AppTheme> copyWith({
    Color? primaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
  }) =>
      AppTheme(
        primaryColor: primaryColor ?? this.primaryColor,
        tertiaryColor: tertiaryColor ?? this.tertiaryColor,
        neutralColor: neutralColor ?? this.neutralColor,
      );

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) return this;
    return AppTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
    );
  }
}

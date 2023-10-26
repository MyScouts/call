part of 'theme.dart';

class ThemeText {
  late TextTheme _textTheme;
  final ThemeColor themeColor;
  final String fontFamily;

  ThemeText(
    this.fontFamily, {
    required this.themeColor,
    TextTheme? textTheme,
  }) {
    _textTheme = TextTheme(
      //<---Tag Design_design Figma
      //headling 1
      displayLarge: styleByFontFamily(
        fontSize: 32,
        fontWeight: FontWeight.normal,
      ),

      //headling 2
      displayMedium: styleByFontFamily(
        fontSize: 28,
        fontWeight: FontWeight.normal,
      ),

      //headling 3
      displaySmall: styleByFontFamily(
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),

      //headling 4
      headlineLarge: styleByFontFamily(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),

      //headling 5
      headlineMedium: styleByFontFamily(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),

      //headling 6
      headlineSmall: styleByFontFamily(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),

      //Paragraphh: Text normal in app
      bodyMedium: styleByFontFamily(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),

      //Small text: TimeAgo - Share
      bodySmall: styleByFontFamily(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),

      //Paragraph Exxtend
      labelMedium: styleByFontFamily(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),

      //Tag Design_design Figma-->

      /// Text in Button
      labelLarge: styleByFontFamily(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),

      /// Text in AppBar
      titleLarge: styleByFontFamily(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),

      titleSmall: styleByFontFamily(
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),

      bodyLarge: styleByFontFamily(
        fontSize: 15,
        fontWeight: FontWeight.w900,
      ),

      /// Text in TextField, Title of Listile
      titleMedium: styleByFontFamily(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  TextTheme get getTextTheme => _textTheme;
  TextStyle get paragraph => _textTheme.bodyMedium!;
  TextStyle get paragraphExt => _textTheme.labelMedium!;
  TextStyle get smallText => _textTheme.bodySmall!;

  TextStyle get textButtonThemeStyle => _textTheme.labelLarge!.merge(
        TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      );
  TextStyle get textTitleAppbarThemeStyle => _textTheme.labelLarge!.merge(
        TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 16,
        ),
      );
  TextStyle get tabBarThemeLabelStyle => _textTheme.bodyLarge!.merge(TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ));

  TextStyle get tabBarThemeUnselectedLabelStyle =>
      _textTheme.bodyLarge!.merge(TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ));

  TextStyle styleByFontFamily({
    String? fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: themeColor.textColor,
      package: 'design_system',
    );
  }
}

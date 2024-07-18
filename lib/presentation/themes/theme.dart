import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff961c22),
      surfaceTint: Color(0xffae2f31),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc94242),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff842325),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffb34645),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2f2f2f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff515151),
      onTertiaryContainer: Color(0xfff4f1f1),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff444748),
      outline: Color(0xff747878),
      outlineVariant: Color(0xffc4c7c7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffffb3ae),
      primaryFixed: Color(0xffffdad7),
      onPrimaryFixed: Color(0xff410005),
      primaryFixedDim: Color(0xffffb3ae),
      onPrimaryFixedVariant: Color(0xff8d141c),
      secondaryFixed: Color(0xffffdad7),
      onSecondaryFixed: Color(0xff410005),
      secondaryFixedDim: Color(0xffffb3af),
      onSecondaryFixedVariant: Color(0xff842325),
      tertiaryFixed: Color(0xffe4e2e1),
      onTertiaryFixed: Color(0xff1b1c1c),
      tertiaryFixedDim: Color(0xffc8c6c6),
      onTertiaryFixedVariant: Color(0xff474747),
      surfaceDim: Color(0xffddd9d8),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e6),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff870f19),
      surfaceTint: Color(0xffae2f31),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc94242),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff7e1f22),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffb34645),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2f2f2f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff515151),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff404344),
      outline: Color(0xff5c6060),
      outlineVariant: Color(0xff787b7c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffffb3ae),
      primaryFixed: Color(0xffcd4544),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xffab2c2f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffc1504f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xffa03838),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff757474),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5c5c5c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd9d8),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e6),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4d0007),
      surfaceTint: Color(0xffae2f31),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff870f19),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4d0008),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7e1f22),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff222222),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff434343),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff212525),
      outline: Color(0xff404344),
      outlineVariant: Color(0xff404344),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffffe7e4),
      primaryFixed: Color(0xff870f19),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff61000b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7e1f22),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5f060e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff434343),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2c2d2d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd9d8),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e6),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb3ae),
      surfaceTint: Color(0xffffb3ae),
      onPrimary: Color(0xff68000d),
      primaryContainer: Color(0xffbd393a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffffb3af),
      onSecondary: Color(0xff640a12),
      secondaryContainer: Color(0xff942f30),
      onSecondaryContainer: Color(0xfffff2f0),
      tertiary: Color(0xffc8c6c6),
      onTertiary: Color(0xff303030),
      tertiaryContainer: Color(0xff393939),
      onTertiaryContainer: Color(0xffcccaca),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffc4c7c7),
      outline: Color(0xff8e9192),
      outlineVariant: Color(0xff444748),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xffae2f31),
      primaryFixed: Color(0xffffdad7),
      onPrimaryFixed: Color(0xff410005),
      primaryFixedDim: Color(0xffffb3ae),
      onPrimaryFixedVariant: Color(0xff8d141c),
      secondaryFixed: Color(0xffffdad7),
      onSecondaryFixed: Color(0xff410005),
      secondaryFixedDim: Color(0xffffb3af),
      onSecondaryFixedVariant: Color(0xff842325),
      tertiaryFixed: Color(0xffe4e2e1),
      onTertiaryFixed: Color(0xff1b1c1c),
      tertiaryFixedDim: Color(0xffc8c6c6),
      onTertiaryFixedVariant: Color(0xff474747),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2b2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb9b5),
      surfaceTint: Color(0xffffb3ae),
      onPrimary: Color(0xff370003),
      primaryContainer: Color(0xfff2605e),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffb9b5),
      onSecondary: Color(0xff370004),
      secondaryContainer: Color(0xffe46b68),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffcccaca),
      onTertiary: Color(0xff161616),
      tertiaryContainer: Color(0xff919090),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xfffefaf9),
      onSurfaceVariant: Color(0xffc8cbcc),
      outline: Color(0xffa0a3a4),
      outlineVariant: Color(0xff808484),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff8e161d),
      primaryFixed: Color(0xffffdad7),
      onPrimaryFixed: Color(0xff2d0002),
      primaryFixedDim: Color(0xffffb3ae),
      onPrimaryFixedVariant: Color(0xff73000f),
      secondaryFixed: Color(0xffffdad7),
      onSecondaryFixed: Color(0xff2d0003),
      secondaryFixedDim: Color(0xffffb3af),
      onSecondaryFixedVariant: Color(0xff6d1117),
      tertiaryFixed: Color(0xffe4e2e1),
      onTertiaryFixed: Color(0xff111111),
      tertiaryFixedDim: Color(0xffc8c6c6),
      onTertiaryFixedVariant: Color(0xff363636),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2b2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f9),
      surfaceTint: Color(0xffffb3ae),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb9b5),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffb9b5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffdfafa),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffcccaca),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff9fbfc),
      outline: Color(0xffc8cbcc),
      outlineVariant: Color(0xffc8cbcc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff5c000a),
      primaryFixed: Color(0xffffe0dd),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb9b5),
      onPrimaryFixedVariant: Color(0xff370003),
      secondaryFixed: Color(0xffffe0dd),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffb9b5),
      onSecondaryFixedVariant: Color(0xff370004),
      tertiaryFixed: Color(0xffe8e6e6),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffcccaca),
      onTertiaryFixedVariant: Color(0xff161616),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2b2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

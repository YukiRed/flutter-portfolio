import 'package:flutter/material.dart';
import 'theme_controller.dart';

ThemeBundle buildTheme(AppPalette palette) {
  final seed = _seedFor(palette);

  final light = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.light,
  );
  final dark = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.dark,
  );

  return ThemeBundle(light: _themeFrom(light), dark: _themeFrom(dark));
}

Color _seedFor(AppPalette p) => switch (p) {
  AppPalette.metal => const Color(0xFF556B8E),
  AppPalette.earth => const Color(0xFF996B2F),
  AppPalette.wood => const Color(0xFF2E7D4F),
  AppPalette.fire => const Color(0xFFCF3D2E),
  AppPalette.water => const Color(0xFF1F7A8C),
};

ThemeData _themeFrom(ColorScheme scheme) {
  // Primary UI font + explicit fallback stack (all bundled in assets/)
  const primaryFamily = 'NotoSans';
  const serifCjk = 'NotoSerifSC';
  const hanSans = 'NotoSansSC';
  const symbols2 = 'NotoSansSymbols2';
  const emoji = 'NotoColorEmoji';
  const mono = 'JetBrainsMono';

  final base = ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    fontFamily: primaryFamily,
    fontFamilyFallback: const [hanSans, serifCjk, symbols2, emoji],
  );

  final text = _textTheme(base.textTheme, serifCjk, mono);

  return base.copyWith(
    textTheme: text,
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 64, // <-- give the bigger title space
      titleTextStyle: text.titleLarge?.copyWith(
        fontSize: (text.titleLarge?.fontSize ?? 20) + 3, // visibly bigger
        fontWeight: FontWeight.w700,
      ),
    ),

    // Make all top-bar / nav buttons a size up
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        // use titleMedium instead of labelLarge
        textStyle: WidgetStateProperty.all(
          text.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        foregroundColor: WidgetStateProperty.all(scheme.onSurface),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
      ),
    ),

    // Popup menus (Explore / Work)
    popupMenuTheme: PopupMenuThemeData(
      textStyle: text.titleMedium,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),

    // Drawer list tiles
    listTileTheme: ListTileThemeData(
      titleTextStyle: text.titleMedium, // bigger labels in the drawer
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    cardTheme: CardTheme(
      // CardThemeData also works; CardTheme is fine
      elevation: 0,
      color: scheme.surfaceContainerLow,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ).data,

    dividerTheme: DividerThemeData(
      color: scheme.outlineVariant,
      thickness: 1,
      space: 24,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: scheme.surfaceContainerLowest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.primary, width: 1.6),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    ),
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      side: BorderSide(color: scheme.outlineVariant),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: scheme.inverseSurface,
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: TextStyle(color: scheme.onInverseSurface),
    ),
  );
}

TextTheme _textTheme(TextTheme base, String displaySerif, String mono) {
  TextStyle tune(
    TextStyle? s, {
    double? size,
    double? height,
    FontWeight? w,
    String? family,
  }) {
    s ??= const TextStyle();
    return s.copyWith(
      fontFamily: family ?? s.fontFamily,
      fontSize: size ?? s.fontSize,
      height: height ?? s.height ?? 1.2,
      fontWeight: w ?? s.fontWeight,
      letterSpacing: 0,
    );
  }

  // Display/Headlines use Serif SC (gives that classical feel for Chinese headings)
  final t = base;
  return t
      .copyWith(
        displayLarge: tune(
          t.displayLarge,
          height: 1.12,
          family: displaySerif,
          w: FontWeight.w600,
        ),
        displayMedium: tune(
          t.displayMedium,
          height: 1.14,
          family: displaySerif,
          w: FontWeight.w600,
        ),
        displaySmall: tune(
          t.displaySmall,
          height: 1.14,
          family: displaySerif,
          w: FontWeight.w600,
        ),
        headlineLarge: tune(
          t.headlineLarge,
          height: 1.16,
          family: displaySerif,
          w: FontWeight.w600,
        ),
        headlineMedium: tune(
          t.headlineMedium,
          height: 1.18,
          family: displaySerif,
          w: FontWeight.w600,
        ),
        headlineSmall: tune(
          t.headlineSmall,
          height: 1.20,
          family: displaySerif,
          w: FontWeight.w600,
        ),

        titleLarge: tune(t.titleLarge, height: 1.24, w: FontWeight.w700),
        titleMedium: tune(t.titleMedium, height: 1.28, w: FontWeight.w600),
        titleSmall: tune(t.titleSmall, height: 1.30, w: FontWeight.w600),

        bodyLarge: tune(t.bodyLarge, height: 1.50),
        bodyMedium: tune(t.bodyMedium, height: 1.52),
        bodySmall: tune(t.bodySmall, height: 1.48),

        labelLarge: tune(t.labelLarge, height: 1.20, w: FontWeight.w600),
        labelMedium: tune(t.labelMedium, height: 1.20, w: FontWeight.w600),
        labelSmall: tune(t.labelSmall, height: 1.20, w: FontWeight.w600),
      )
      .apply(
        // monospace for code automatically via markdown later; keeping here for completeness
        fontFamilyFallback: [mono],
      );
}

class ThemeBundle {
  final ThemeData light;
  final ThemeData dark;
  const ThemeBundle({required this.light, required this.dark});
}

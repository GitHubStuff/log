import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_management/theme_management.dart';

class ThemeAndMaterialWidget extends StatelessWidget with ThemeMixin {
  @override
  Widget build(BuildContext context) {
    return rebuildTreeOnThemeOrCubit(bodyWidget: _body);
  }

  /// Widget wrapper to enclose the BlocBuilder that manages state for changing lanaguage/locale

  Widget _body(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeManagement.darkTheme,
        darkTheme: ThemeManagement.darkTheme,
        themeMode: ThemeManagement.themeMode,
        initialRoute: '/',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('de', ''), // German, no country code
          const Locale('en', ''), // English, no country code
          const Locale('es', ''), // Spanish, no country code
        ],
      ).modular();
}

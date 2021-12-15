import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:zmovies/screens/dashboard_screen.dart';
import 'LanguageChangeProvider.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageChangeProvider>(
      create: (context) =>  LanguageChangeProvider(),
      child: Builder(
        builder: (context) =>
            MaterialApp(
              locale: Provider.of<LanguageChangeProvider>(context, listen: true).currentLocale,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'movie cust',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Dashboardscreen(),
            ),
      ),
    );
  }
}

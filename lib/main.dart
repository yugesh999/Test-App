import 'dart:io';
import 'package:demo_project/shared/widget/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:demo_project/shared/constants/fonts/size_config.dart';
import 'package:demo_project/shared/widget/demolocalization.dart';
import 'package:demo_project/shared/widget/localization_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'api/http_overrides.dart';
import 'feature/home_screen.dart';
import 'feature/main_screen.dart';
import 'shared/constants/providers_constant.dart';
import 'shared/services/base_url_fetch.dart';
import 'shared/singletons/baseurl_singleton.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  String langCode = await getLocale();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    runApp(MyApp(locale: langCode));
  });

}

class MyApp extends StatefulWidget {
  final String? locale;

  const MyApp({this.locale, Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String lang = getLocale().toString();
  Locale _locale = const Locale("en");
  bool isPushNotification = false;
  bool isFirst = false;
  String accessToken = "";

  @override
  void initState() {
    lang = widget.locale!;
    _locale = const Locale('en', 'US');
    FetchUrl.getBaseUrl().then((value) {
      BaseURL.getInstance.setBaseUrl(value);
    });
    super.initState();
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiProvider(
      providers: Providers.listOfProviders,
      child: MaterialApp(
        locale: _locale,
        localizationsDelegates: const [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', 'US')],
        title: 'B4T',
        navigatorKey: navigatorKey,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              surface: Colors.white,
              surfaceVariant: Colors.white,
            ),
            cardTheme: CardThemeData(
              color: Colors.white,
              elevation: 0,
              surfaceTintColor: Colors.transparent,
            ),
            dividerTheme: DividerThemeData(
              color: Colors.grey,
              thickness: 1,
            ),
            primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,

        home: const MainScreen(),

        routes: Routes.routes,
      ),
    );
  }
}
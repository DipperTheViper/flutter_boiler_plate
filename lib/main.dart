import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'src/constants/configs/config_environments.dart';
import 'src/constants/styles/colors/color.dart';
import 'src/constants/styles/themes/theme.dart';
import 'src/di/locator.dart';
import 'src/navigator/navigator.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      );

      const String environment = String.fromEnvironment(
        'ENVIRONMENT',
        defaultValue: Environment.development,
      );
      Environment().initConfig(environment);
      await setupAllDI();
      await SentryFlutter.init(
        (options) {
          options.dsn = Environment().dsnUrl.sentryUrl;

          // options.dsn =
          //     "https://df811451404342b18c6ab4e183bf07ba@prodo.sentry.narvanventures.com/13";
          //production
        },
        appRunner: () => runApp(
          const App(),
        ),
      );
    },
    (exception, stackTrace) async {
      Logger().e(exception);
      Logger().e(stackTrace);
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    },
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // useInheritedMediaQuery: true,
      routeInformationProvider: AppNavigator.router.routeInformationProvider,
      routeInformationParser: AppNavigator.router.routeInformationParser,
      routerDelegate: AppNavigator.router.routerDelegate,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa", "IR"),
      ],
      // navigatorObservers: [
      //   SentryNavigatorObserver(),
      // ],
      locale: const Locale("fa", "IR"),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      color: ColorCategory.red,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme,
      title: 'Narbon',
    );
  }
}

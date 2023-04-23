import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gptool/pages/settings/guide.dart';
import 'package:gptool/pages/home/home.dart';
import 'package:gptool/pages/splash.dart';

import 'package:url_launcher/url_launcher.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, state) {
        print("state:${state.queryParams}, ${Uri.base.queryParameters}");
        return SplashPage(query: state.queryParams['qr']);
      },
      routes: [
        GoRoute(
          path: 'home',
          builder: (_, __) => const MyHomePage(),
        ),
        GoRoute(
          path: 'guide',
          builder: (_, __) => const GuidePage(),
        ),
      ],
    ),
  ],
);

void main() async {
  if (kIsWeb) {
    final qrCodeLink = Uri.base.queryParameters["qr"];
    print("Uri.base.queryParameters:${Uri.base.fragment}");
    if (qrCodeLink != null) {
      launchUrl(
          Uri(
              scheme: "gptool",
              host: "link",
              path: "/",
              queryParameters: {"qr": Uri.encodeComponent(qrCodeLink)}),
          webOnlyWindowName: "_self");
    }
  }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return MaterialApp.router(
        title: 'GPTool',
        theme: ThemeData.light(useMaterial3: true)
            .copyWith(colorScheme: lightDynamic),
        darkTheme: ThemeData.dark(useMaterial3: true)
            .copyWith(colorScheme: darkDynamic),
        routerConfig: _router,
      );
    });
  }
}

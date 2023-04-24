import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gptool/pages/settings/guide.dart';
import 'package:gptool/pages/home/home.dart';
import 'package:gptool/pages/splash.dart';

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

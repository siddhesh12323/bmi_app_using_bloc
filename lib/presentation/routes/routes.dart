import 'package:flutter/material.dart';

import '../screens/customize_screen.dart';
import '../screens/home_screen.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

//final CounterCubit _counterCubit = CounterCubit();


class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/customize':
        return MaterialPageRoute(builder: (_) => const CustomizeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}

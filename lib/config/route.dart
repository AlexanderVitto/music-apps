import 'package:flutter/material.dart';

import '../screen/search/search_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // Here we'll handle all the routing

  var routes = <String, WidgetBuilder>{
    SearchScreen.routeName: (_) => SearchScreen(),
  };

  WidgetBuilder builder = routes[settings.name];

  return PageRouteBuilder(
      settings: settings,
      pageBuilder: (ctx, __, ___) => builder(ctx),
      transitionsBuilder: (_, a, __, c) =>
          FadeTransition(opacity: a, child: c));
  //return MaterialPageRoute(settings: settings, builder: (ctx) => builder(ctx));
}

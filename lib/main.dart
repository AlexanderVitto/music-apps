import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/configs.dart';

void main() {
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: setupProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Boom Box',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          fontFamily: 'Open-Sans',
        ),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}

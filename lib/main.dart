import 'package:flutter/material.dart';

//core packages
import 'package:testapp/utils/const.dart';
import 'package:testapp/utils/theme_config.dart';
import 'package:testapp/screens/navbar.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NavBar(),
      // initialRoute: '/',
      // onGenerateRoute: generateRoute,
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
    );
  }
}


import 'package:flutter/material.dart';
import 'package:learn_dio/home_page.dart';
import 'package:learn_dio/service/dio_servives/service_locator.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
 serviceLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData.light(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

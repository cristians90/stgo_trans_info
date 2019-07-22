import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/predictorInfoProvider.dart';
import 'screens/homeScreen.dart';
import 'screens/stopInfoScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => PredictorInfoProvider())
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: 'SCL Trans Info',
        initialRoute: 'home',
        routes: {
          'home': (context) => HomeScreen(),
          'stopInfo': (context) => StopInfoScreen()
        },
      ),
    );
  }
}

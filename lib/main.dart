import 'package:flutter/material.dart';
import 'package:the_guardian_app/providers/home_provider.dart';
import 'package:the_guardian_app/screens/screens.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyAppState());

class MyAppState extends StatelessWidget {
  const MyAppState({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider( providers: [
      ChangeNotifierProvider(create: (_) => NewsProvider(), lazy: false,)
    ],
      child: MyApp(),
    );
  }
}
 
class MyApp extends StatelessWidget {
  
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (_) => HomeScreen(),
        '/newsScreen': (_) => NewsScreen(),
        '/aboutScreen': (_) => AboutScreen(),
      },
      theme: ThemeData(
        fontFamily: 'GuardianEgyp'
      ),
    );
  }
}
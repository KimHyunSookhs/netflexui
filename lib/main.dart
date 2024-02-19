import 'package:flutter/material.dart';
import 'package:netflexui/firebase_options.dart';
import 'package:netflexui/screen/home_screen.dart';
import 'package:netflexui/screen/like_screen.dart';
import 'package:netflexui/screen/search_screen.dart';
import 'package:netflexui/widget/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ), builder: (context, snapshot){
      return MaterialApp(
        title: 'Netflex',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          colorScheme: ColorScheme.dark(
            primary: Colors.black,
            secondary: Colors.white,
          ),
        ),
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children:<Widget> [
                HomeScreen(),
               SearchScreen(),
              LikeScreen(),
                  Container(child: Center(
                  child: Text('몰라'),
                ),),
              ],
            ),
            bottomNavigationBar: Bottom(),
          ),),
      );
    },);


  }
}

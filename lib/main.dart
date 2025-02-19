import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test3/views/users.dart';
import 'views/home.dart';
import 'views/Lunch.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'OpenSans'),
      home:  HomeScreen(),
      routes: {
        '/bre': (context) => HomePage(),
        '/Home': (context) => HomeScreen(),
        '/Lunch':(context) =>Lunch(),
        '/users':(context) =>users()
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/bre');
                  },
                  child: const Text('Breakfast'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Lunch');
                  },
                  child: const Text('lunch'),
                ),
                ElevatedButton(onPressed:(){
                  Navigator.pushNamed(context, '/users');
                },child: Text('fetchuser'),),


              ],
            ),
          ),
        ],
      ),
    );
  }



}

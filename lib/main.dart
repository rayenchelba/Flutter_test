import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test3/views/users.dart';
import 'class/todoliste.dart';
import 'data/datacontrol.dart';
import 'views/home.dart';
import 'views/Lunch.dart';
import 'views/form.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
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
        '/users':(context) =>users(),
        '/form':(context) =>form(),
        '/main':(context)=>MyApp()
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
                ElevatedButton(onPressed:()async{
                  List<Welcome> to= await datacrtl().getData();
                  Navigator.pushNamed(context, '/form',arguments: to);
                },child: Text('formulaire'),),


              ],
            ),
          ),
        ],
      ),
    );
  }



}

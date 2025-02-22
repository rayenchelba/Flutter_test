import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class users extends StatefulWidget {
  const users({super.key});

  @override
  State<users> createState() => _usersState();
}

class _usersState extends State<users> {
  List<dynamic> users=[];
  double mlper=0;
  double feper=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchusers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: buildAppBar(context),
      body: Column(children: [
        SizedBox(height: 20,),
        Center(child: Text('Usres List',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.all(10),
          height: 300,
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context,index){
                final user =users[index];
                return ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(user['picture']['thumbnail'])),
                  subtitle: Text(user['email'],style: TextStyle(color: Colors.black,fontSize: 20),),
                  title: Text(user['name']['first']),
                );
              }),
        ),
        SizedBox(height: 20,),
        Center(child: Text('Usres Statistic',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
        SizedBox(height: 20,),
        SizedBox(
          height: 200,
          child: PieChart(
              PieChartData(
                  sections:[
                    PieChartSectionData(
                        value: mlper,
                        title: 'Man',
                        color: Colors.blue
                    ),
                    PieChartSectionData(
                        value: feper,
                        title: 'female',
                        color: Colors.red
                    )
                  ]
              )
          ),
        )
      ],),
    );
  }
  void fetchusers() async{
    print('fetch call');
    const url="https://randomuser.me/api/?results=100";
    final uri=Uri.parse(url);
    final response =await http.get(uri);
    final body=response.body;
    final json=jsonDecode(body);
    setState((){
      users=json['results'];
    });
    print('fetch complite');
    calculateGenderPercentage(users);
  }
  void calculateGenderPercentage(List<dynamic> users) {
    int male = users.where((user) => user['gender'] == 'male').length;
    int female = users.where((user) => user['gender'] == 'female').length;
    int total = male + female;

    double malePercentage = total > 0 ? (male / total) * 100 : 0;
    double femalePercentage = total > 0 ? (female / total) * 100 : 0;
    setState(() {
      mlper=malePercentage;
      feper=femalePercentage;
    });
    print('Male: $malePercentage%');
    print('Female: $femalePercentage%');
  }
}
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: const Text(
      'Users',
      style: TextStyle(
        color: Colors.blueAccent,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/Home');
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset('assets/icons/fl.svg', height: 20, width: 20),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 37,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset('assets/icons/bt.svg', height: 20, width: 20),
        ),
      ),
    ],
  );
}
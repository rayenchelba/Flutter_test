import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test3/data/datacontrol.dart';
import '../class/todo.dart';
import '../class/todoliste.dart';

class form extends StatefulWidget {
  const form({super.key });


  @override
  State<form> createState() => _formState();
}
final _formkey=GlobalKey<FormState>();
String title='';
String description='';
Priorities prio=Priorities.low;
dynamic de;

List<todo> todos = [
  todo(title:'Homework', description:'Exercises I have to do tomorrow', priorities:Priorities.high),
  todo(title:'Shopping', description:'Buy groceries for the week', priorities:Priorities.medium),
  todo(title:'Workout', description:'1-hour gym session', priorities:Priorities.urgent),
];
class _formState extends State<form> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<List<Welcome>> to= datacrtl().getData();
  }
  @override
  Widget build(BuildContext context) {
    final List<Welcome> to = ModalRoute.of(context)!.settings.arguments as List<Welcome>;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(children: [Container(
        height: 300,
      child: ListView.builder(
      itemCount: to.length,
          itemBuilder: (context,index){
            return  Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              color: to[index].completed ? Colors.green : Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            to[index].userId.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            to[index].title,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      to[index].completed ? 'completed' : 'incomplete',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );

          }),
    ),
        Form(
            key: _formkey,
            child: Column(
          children: [
            TextFormField(
              maxLength: 20,
              decoration: InputDecoration(
                label: Text('sprint title')
              ),
              validator: (value){
                if(value==null||value.isEmpty){
                  return('this field is required');
                }
                else{
                  return(null);
                }
              },
              onSaved: (value){
                title=value!;
              },
            ),
            TextFormField(
              maxLength: 40,
              decoration: InputDecoration(
                  label: Text('sprint description')
              ),
              validator: (value){
                if(value==null||value.isEmpty||value.length<=5){
                  return('this field should more then 5 characters');
                }
                else{
                  return(null);
                }
              },
              onSaved: (value){
                description=value!;
              },
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                label: Text('sprint priorities')
              ),
              value: prio,
                items: Priorities.values.map((p){
              return DropdownMenuItem(
                  value: p,
                  child: Text(p.title));}).toList(),
            onChanged: (value){
            },
              onSaved: (value){
              prio=value!;
            },),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    FilledButton(onPressed: () async{
                      if(_formkey.currentState!.validate()){
                    _formkey.currentState!.save();
                    setState(() {
                      todos.add(todo(title: title, description: description, priorities: prio));
                    });
                    _formkey.currentState!.reset();
                    print('posting data ...');
                    await datacrtl().postData(title: title, description: description, prio: prio.title).then((onValue){
                      print(onValue);
                    });
                    datacrtl().getData();
                    prio=Priorities.low;
                    bool f=await datacrtl().uploadfile(de);
                    if (f) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('File upload successfully')));
                        print('upload success');

                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('File upload successfully')));
                        print('failed to upload');
                    }
}
                                  
                                  },
                      style: FilledButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    child: Text('submit'),),
                GestureDetector(child: Icon(Icons.file_upload),
                onTap: ()async{
                  dynamic d= await datacrtl().select();
                  setState(() {
                  de=d;
                });
                },)
                  ],
            )
          ],
        )
        )

      ]),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Todo List',
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
          Navigator.pushNamed(context, '/main');
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
}


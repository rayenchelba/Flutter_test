import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'class/pancake.dart';

class detail1 extends StatefulWidget {
  const detail1({super.key});

  @override
  State<detail1> createState() => _detail1State();
}
Pancake p=Pancake.getpan();

class _detail1State extends State<detail1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    PageController crtl=PageController();
    return Scaffold(
      appBar: buildAppBar(context),
      body:Container(
        height: 400,
        child: PageView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 30, 50),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xff92A3FD).withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                  children: [
                Text('ingrediant',style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700
                ),),
              SizedBox(height: 10,),
              Expanded(

                child:
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                    return Container(
                      child: Text(p.ingrediant[index],style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                      ),),
                    );
                  },
                      separatorBuilder: (context,index)=>SizedBox(height: 10,),
                      itemCount: p.ingrediant.length)


              )]),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 30, 50),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xff92A3FD).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                  children: [
                    Text('ingrediant',style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700
                    ),),
                    SizedBox(height: 10,),
                    Expanded(

                        child:
                        ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context,index){
                              return Container(
                                child: Text(p.how[index],style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20
                                ),),
                              );
                            },
                            separatorBuilder: (context,index)=>SizedBox(height: 10,),
                            itemCount: p.how.length)


                    )]),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 30, 50),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xff92A3FD).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                  children: [
                    Text('ingrediant',style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700
                    ),),
                    SizedBox(height: 10,),
                    Expanded(

                        child:
                        ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context,index){
                              return Container(
                                child: Text(p.general[index],style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20
                                ),),
                              );
                            },
                            separatorBuilder: (context,index)=>SizedBox(height: 10,),
                            itemCount: p.general.length)


                    )]),
            )

          ],
        ),
      ) ,
    );
  }
}
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: const Text(
      'Honey Pancacke',
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
        Navigator.pushNamed(context, '/bre');
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SvgPicture.asset('assets/icons/fl.svg', height: 20, width: 20),
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 37,
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/icons/bt.svg', height: 20, width: 20),
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ],
  );
}


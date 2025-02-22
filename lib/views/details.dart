import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class detail1 extends StatefulWidget {
  final dynamic p;
  const detail1({super.key, required this.p});

  @override
  State<detail1> createState() => _detail1State();
}


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
      body:SizedBox(
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
                      child: Text(widget.p.ingrediant[index],style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                      ),),
                    );
                  },
                      separatorBuilder: (context,index)=>SizedBox(height: 10,),
                      itemCount: widget.p.ingrediant.length)


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
                                child: Text(widget.p.how[index],style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20
                                ),),
                              );
                            },
                            separatorBuilder: (context,index)=>SizedBox(height: 10,),
                            itemCount: widget.p.how.length)


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
                                child: Text(widget.p.general[index],style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20
                                ),),
                              );
                            },
                            separatorBuilder: (context,index)=>SizedBox(height: 10,),
                            itemCount: widget.p.general.length)


                    )]),
            )

          ],
        ),
      ) ,
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(widget.p.name,
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


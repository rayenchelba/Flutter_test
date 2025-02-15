import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/class/categort_model.dart';
import '/class/recommendation.dart';
import '/class/popular.dart';
import 'detail1.dart';
import 'detail2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = [];
  List<Recommendation> rec = [];
  List<Popular> pop = [];


  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchRecommendation();
    fetchPopular();
  }
  void fetchRecommendation() {
    setState(() {
      rec = Recommendation.getrec();
    });
  }

  void fetchCategories() {
    setState(() {
      categories = Category.getCategories();
    });
  }
  void fetchPopular() {
    setState(() {
      pop = Popular.getPopular();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.only(top: 20)),
          searchBar(),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Category',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
          const SizedBox(height: 10),
          categoryList(),
          const SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.only(left: 20),
            child: Text('Recommended Categories',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20
            ),),
          ),
          const SizedBox(height: 20),
          recommend(),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Popular',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20
            ),),
          ),
          const SizedBox(height: 20),
          popular()



        ],
      ),
    );
  }

  Container popular() {
    return Container(
          height: 250,
          child: ListView.separated(
            separatorBuilder:(context,index)=>SizedBox(height: 1,) ,
            scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: pop.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: EdgeInsets.only(top: 20,left: 30,right: 30),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow:[ BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 10),
                        blurRadius: 40,
                        spreadRadius: 0
                      ) ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 2, 2, 2),
                          width:80,
                    child: SvgPicture.asset(pop[index].icon,),),

                        SizedBox(width: 20,),
                        Column( mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                            child: Text(pop[index].nom,style: TextStyle(color: Colors.black),),
                          ),
                            SizedBox(height: 2,),
                            Container(
                              child: Text(pop[index].deficulty+'|'+pop[index].time+'|'+pop[index].kal,style: TextStyle(color: Colors.black),),
                            ),]
                        ),
                        SizedBox(width: 40,),
                        Container(
                          width: 20,
                          child: Center(child: SvgPicture.asset('assets/icons/rt-fl.svg')),
                        )



                      ],
                    ),
                  ),
                );
              })


        );
  }

  Container recommend() {
    return Container(
          height: 220,
          child: Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 12),
              itemCount: rec.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                    color: rec[index].bcolor.withOpacity(0.4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        child :Padding(padding: EdgeInsets.all(12),
                        child: SvgPicture.asset(rec[index].icon, height: 100,),
                      ),),
                      SizedBox(height: 2,),
                      Container(
                        child: Text(rec[index].nom,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                      ),
                      SizedBox(height: 2,),
                      Container(
                        child: Text(rec[index].deficulty+'|'+rec[index].time+'|'+rec[index].kal,style: TextStyle(color: Color(0xff7B6F72),fontSize: 13),),
                      ),
                      SizedBox(height: 10,),

                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors:[ rec[index].selected ? Color(0xff92A3FD) :Colors.transparent,
                            rec[index].selected ? Color(0xffC58BF2) :Colors.transparent]),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: GestureDetector(
                              child: Text('View'),
                          onTap: (){
                                if(index==0){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>detail1()));}
                                else{
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>detail2()));}
                          },)
                        ),
                      )

                    ],
                  ),
                );
              },
            ),
          ),
        );
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xff1D1617).withOpacity(0.10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white60,
          hintText: 'Search here...',
          hintStyle: const TextStyle(fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/sr.svg', height: 25),
          ),
          suffixIcon: Container(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const VerticalDivider(
                  color: Colors.black,
                  indent: 10,
                  endIndent: 10,
                  thickness: 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/fr.svg', height: 20),
                ),
              ],
            ),
          ),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget categoryList() {
    return Container(
      height:100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index)=>SizedBox(width: 20,),
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            decoration: BoxDecoration(
              color: categories[index].boxcolor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      decoration:BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset(categories[index].iconPath, height: 35))),
                  SizedBox(height: 2),
                  Text(
                    categories[index].nom,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Test Project',
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
}

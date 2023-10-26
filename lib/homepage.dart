import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import 'custom_clipper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  List Images = [
    {"id": 1, "image_path": "assets/4.jpg"},
    {"id": 2, "image_path": "assets/5.jpg"},
    {"id": 3, "image_path": "assets/6.jpg"}
    
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  bool isPressed = true;
  bool Pressed = true;
  bool tap = true;
  bool tapu = true;
  bool tapui = true;
  bool tapuio = true;
  @override
  Widget build(BuildContext context) {
    double blur = isPressed ? 5 : 10;
    Offset distance = isPressed ? Offset(5, 5) : Offset(10, 10);
    double bluro = Pressed ? 5 : 10;
    Offset distanceo = Pressed ? Offset(5, 5) : Offset(10, 10);
    double bluri = tap ? 5 : 10;
    Offset distancei = tap ? Offset(5, 5) : Offset(10, 10);
    double blurio = tapu ? 5 : 10;
    Offset distanceio = tapu ? Offset(5, 5) : Offset(10, 10);
    double blurioi = tapui ? 5 : 10;
    Offset distanceioi = tapui ? Offset(5, 5) : Offset(10, 10);
    double blury = tapuio ? 5 : 10;
    Offset distancey = tapuio ? Offset(5, 5) : Offset(10, 10);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.greenAccent,
          color: Colors.blue,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index){
            print(index);
          },
          items: [
            Image.asset("assets/home.gif"),
            Image.asset("assets/boss.gif"),
            Image.asset("assets/professor.gif"),
            Image.asset("assets/student.gif"),
          ]),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Image.asset("assets/2.png"),
        title: Padding(
          padding: EdgeInsets.only(right: 45),
          child: Center(
              child: Text("XYZ Ultimate Solutions",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),)),
        ),
        toolbarHeight: 110,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: AppBarCustomClipper(),
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.green],


              ),
            ),

          ),
        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: Column(
          children: [
            SizedBox(
              height: 1,
            ),
            Stack(
              children: [
                InkWell(
                  onTap: (){
                    print(currentIndex);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: CarouselSlider(
                        items: Images.map((item) => Image.asset(
                          item['image_path'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )
                        ).toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          scrollPhysics: BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason){
                            setState(() {
                              currentIndex = index;
                            });
                          }
                        ),
                      ),

                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: Images.asMap().entries.map((entry){
                      print(entry);
                      print(entry.key);
                      return AnimatedSmoothIndicator(activeIndex: currentIndex, count: 3,
                        effect: ExpandingDotsEffect(
                          dotHeight: 10,
                          dotWidth: 6,
                          dotColor: Vx.blue500,
                          activeDotColor: currentIndex == entry.key ? Colors.red : Colors.teal
                        ),
                      );
                    }).toList(),
                  ),
                ),
                
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Container(
                height: 130,
                width: 500,

                decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue,Colors.greenAccent],
                  
                ),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))


                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){

                    },
                      child: Padding(
                        padding: EdgeInsets.only(left: 10,top: 10),
                        child: Text("Attendance Reports",style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white
                        ),

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Total Students: 884",style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white
                      ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text("Mark Attendance: 0",style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white
                          ),


                          ),
                        ),




                      ]
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Row(
                            children: [
                             Container(
                              height: 30,
                               width: 30,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(
                                child: Text("P",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),
                                ),
                              ),
                            ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("0",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white)),
                      ]
                          ),
                          SizedBox(
                            width: 110,
                          ),
                          Row(
                            children: [
                             Container(
                              height: 30,
                              width: 30,

                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5)

                              ),
                              child: Center(
                                child: Text("A",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),
                              ),
                            ),
                            ),
                              SizedBox(
                                width:10 ,
                              ),
                              Text("0",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white)),
                      ]
                          ),
                          SizedBox(
                            width: 100,
                          ),



                          Row(
                            children: [
                             Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(5)

                              ),
                              child: Center(
                                  child: Text("L",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),)),
                            ),
                              SizedBox(
                                width: 10 ,
                              ),
                              Text("0",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white)),
                      ]
                          ),

                        ],
                      ),
                    )



                  ],



                ),








                
                
              ),


            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: 400,

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue, Colors.greenAccent]
                    ),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15))
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Image.asset("assets/payment.gif"),
                            Text("Fee Collection",
                              style:
                              TextStyle(fontSize: 17, fontWeight: FontWeight.w800,fontStyle: FontStyle.italic,color: Colors.white),),

                            
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () =>
                        setState(() =>
              isPressed = !isPressed),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                height: 70,
                                width: 150,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Colors.greenAccent,Colors.yellowAccent]
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: blur,
                                      offset: -distance,
                                      color: Colors.white,




                                    ),
                                    BoxShadow(
                                      blurRadius: blur,
                                      offset: distance,
                                      color: Colors.lightGreenAccent,




                                    )
                                  ]
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left:10,top: 10),
                                      child: Row(
                                          children: [
                                            Text("Today",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),),
                                          ]
                                      ),
                                    ),

                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                        children : [
                                          Padding(
                                              padding: EdgeInsets.only(left: 11,top: 10),
                                              child: Text("0-Entries",style: TextStyle(color: Colors.black),)
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 40,top: 10),
                                            child: Text("Rs.0/-",style: TextStyle(color: Colors.black,fontSize: 15),),
                                          ),

                                        ]
                                    ),













                                  ],




                                ),

                              ),

                            ),
                            SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  setState(() =>
                                  Pressed = !Pressed),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                height: 70,
                                width: 150,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [Colors.greenAccent,Colors.yellowAccent]
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: bluro,
                                        offset: -distanceo,
                                        color: Colors.white,




                                      ),
                                      BoxShadow(
                                        blurRadius: bluro,
                                        offset: distanceo,
                                        color: Colors.lightGreenAccent,




                                      )
                                    ]
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left:10,top: 10),
                                      child: Row(
                                          children: [
                                            Text("Monthly",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),),
                                          ]
                                      ),
                                    ),

                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                        children : [
                                          Padding(
                                              padding: EdgeInsets.only(left: 11,top: 10),
                                              child: Text("1-Entries",style: TextStyle(color: Colors.black),)
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 20,top: 10),
                                            child: Text("Rs.477/-",style: TextStyle(color: Colors.black,fontSize: 15),),
                                          ),

                                        ]
                                    ),













                                  ],




                                ),

                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      GestureDetector(
                        onTap: () =>
                            setState(() =>
                            tap = !tap),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          height: 70,
                          width: 250,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.greenAccent,Colors.yellowAccent]
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: bluri,
                                  offset: -distancei,
                                  color: Colors.white,




                                ),
                                BoxShadow(
                                  blurRadius: bluri,
                                  offset: distancei,
                                  color: Colors.lightGreenAccent,



                                )

                              ]
                          ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left:10,top: 10),
                                    child: Row(
                                      children: [
                                         Text("Annually",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),),
                          ]
                        ),
                                ),

                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children : [
                                   Padding(
                                      padding: EdgeInsets.only(left: 11,top: 10),
                                      child: Text("142-Entries",style: TextStyle(color: Colors.black),)
                                  ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 80,top: 10),
                                        child: Text("Rs.324519/-",style: TextStyle(color: Colors.black,fontSize: 15),),
                                    ),

                ]
                                ),













                              ],


                              

                            ),




                        ),

                        ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Image.asset("assets/cake.gif"),
                            Text("Upcoming Birthday",
                              style:
                              TextStyle(fontSize: 17, fontWeight: FontWeight.w800,fontStyle: FontStyle.italic,color: Colors.white),),


                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  setState(() =>
                                  tapui = !tapui),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                height: 70,
                                width: 150,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [Colors.greenAccent,Colors.yellowAccent]
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: blurioi,
                                        offset: -distanceioi,
                                        color: Colors.white,




                                      ),
                                      BoxShadow(
                                        blurRadius: blurioi,
                                        offset: distanceioi,
                                        color: Colors.lightGreenAccent,




                                      )
                                    ]
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left:10,top: 10),
                                      child: Row(
                                          children: [
                                            Text("Student",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),),
                                          ]
                                      ),
                                    ),

                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                        children : [
                                          Padding(
                                              padding: EdgeInsets.only(left: 11,top: 10),
                                              child: Text("0",style: TextStyle(color: Colors.black),)
                                          ),
                                          GestureDetector(
                                            onTap: (){

                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 65,top: 10),
                                              child: Text("View all",style: TextStyle(color: Colors.black,fontSize: 15),),
                                            ),
                                          ),

                                        ]
                                    ),













                                  ],




                                ),

                              ),

                            ),
                            SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  setState(() =>
                                  tapu = !tapu),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                height: 70,
                                width: 150,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [Colors.greenAccent,Colors.yellowAccent]
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: blurio,
                                        offset: -distanceio,
                                        color: Colors.white,




                                      ),
                                      BoxShadow(
                                        blurRadius: blurio,
                                        offset: distanceio,
                                        color: Colors.lightGreenAccent,




                                      )
                                    ]
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left:10,top: 10),
                                      child: Row(
                                          children: [
                                            Text("Teacher",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),),
                                          ]
                                      ),
                                    ),

                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                        children : [
                                          Padding(
                                              padding: EdgeInsets.only(left: 11,top: 10),
                                              child: Text("0",style: TextStyle(color: Colors.black),)
                                          ),
                                          GestureDetector(
                                            onTap: (){

                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 65,top: 10),
                                              child: Text("View all",style: TextStyle(color: Colors.black,fontSize: 15),),
                                            ),
                                          ),

                                        ]
                                    ),













                                  ],




                                ),

                              ),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Image.asset("assets/brain.gif"),
                            Text("Thought",
                              style:
                              TextStyle(fontSize: 17, fontWeight: FontWeight.w800,fontStyle: FontStyle.italic,color: Colors.white),),


                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            setState(() =>
                            tapuio = !tapuio),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          height: 60,
                          width: 350,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.greenAccent,Colors.yellowAccent]
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: blury,
                                  offset: -distancey,
                                  color: Colors.white,




                                ),
                                BoxShadow(
                                  blurRadius: blury,
                                  offset: distancey,
                                  color: Colors.lightGreenAccent,




                                )
                              ]
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                              child: Text("Learning is a treasure that follow its owner everywhere",style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic,fontWeight: FontWeight.w600,color: Colors.black),)),

                        ),

                      ),


                      
                    ],
                  ),
                  
                  

                ),
              ),
            ),






          ],
        ),
      ),

    );
  }

}



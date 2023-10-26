import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:xyz_admin_app/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 8),() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), )
      );
      Fluttertoast.showToast(msg: "Welcome dear Students",toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,backgroundColor: Colors.black.withOpacity(0.8),textColor: Colors.white,fontSize: 16);

    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 150,top: 20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,


                    onTap: (){


                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(image: AssetImage(
                          "assets/xyz-logo.jpg"
                        ),


                        ),

                        ),
                      ),
                  ),


                  ),
                SizedBox(height: 50),
                Text("Journey about to start...",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,color: Colors.black)
                  ,),
                Lottie.asset("assets/1.json",
                height: 350,
                width: 350,
                ),
                Lottie.asset("assets/2.json",
                  height: 200,
                  width: 300),
                SizedBox(width: 30,),
                Text("@Copyright by XYZ Ultimate Solution India Pvt Ltd.",style: TextStyle(fontWeight: FontWeight.w500, fontStyle: FontStyle.italic,color: Colors.red),),










              ],
            ),
          ),
        ],

      ),

    );
  }
}

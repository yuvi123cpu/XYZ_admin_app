import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xyz_admin_app/homepage.dart';

Color  kprimarycolor = Color(0xFF345FB4);
Color ksecondarycolor = Color(0xFF6789CA);

late bool _passwordvisibile;
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);



  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool signin = false;


  @override
  void initState() {
    super.initState();
    _passwordvisibile = true;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: Colors.blueAccent,
      body:ListView(
                children:[
                     Container(

                       height: MediaQuery.of(context).size.height / 2.0 ,
                       width: MediaQuery.of(context).size.width,
                       child: Padding(
                         padding: EdgeInsets.only(top:20),
                         child: SingleChildScrollView(
                           scrollDirection: Axis.vertical,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               ClipOval(child: Lottie.asset("assets/3.json",height: 300, width: 300,)),SizedBox(height: 20,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text("Hi",style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w400,color: Colors.white,fontSize: 40
                                   )),
                                   SizedBox(width: 10,),
                                   Text("Student",style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic,color: Colors.white))
                                 ],
                               ),
                               SizedBox(height: 10,),
                               Text("Sign in to Continue",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300, color: Colors.white,fontStyle: FontStyle.italic),)
                             ],
                           ),
                         ),
                       ),



                     ),
                       Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(80), topLeft: Radius.circular(80))
                        ),
                        child:Column(
                          children: [
                            Padding(
                            padding: EdgeInsets.only(top: 60,left: 20,right: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Email Address",
                                    hintStyle: TextStyle(color: Colors.blue
                                    ),
                                    labelText: "Email",
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(color: Colors.purpleAccent),
                                    ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(color: Colors.green)
                                  ),
                                  prefixIcon: Icon(Icons.email,color: Colors.greenAccent,)
                                ),
                                validator: (value) {
                                  RegExp regExp = new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                  if(value == null || value.isEmpty)
                                    {
                                      return "Please enter the email id";
                                    }
                                  else if(!regExp.hasMatch(value)){
                                    return "Please enter a valid email address";
                                  }



                                },
                              ),



                            ),
                            Padding(
                              padding: EdgeInsets.all(30),
                              child: TextFormField(
                                obscureText: _passwordvisibile,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.blue
                                    ),
                                    labelText: "Password",
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(color: Colors.purpleAccent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide(color: Colors.green)
                                    ),
                                    prefixIcon: Icon(Icons.password,color: Colors.greenAccent,),
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        _passwordvisibile = !_passwordvisibile;
                                      });
                                    }, icon: Icon(_passwordvisibile ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                                  )
                                 ),
                    validator: (value) {
                       RegExp regExp = new RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
               if (value!.length < 5) {
        return "Must be more than 5 characters";
       }
               else if(!regExp.hasMatch(value)){
                 return "Please enter a valid password";
               }

    }

                              ),




                            ),
                            SizedBox(height: 20,),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            Future.delayed(Duration(seconds: 3), (){

                                              Navigator.push(context, MaterialPageRoute(builder:  (context) => HomePage()));
                                            });
                                          });

                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(top:1),
                                          child: AvatarGlow(
                                            endRadius: 100,
                                            animate: signin,
                                            duration: Duration(milliseconds: 2000),
                                            glowColor: signin ? Vx.red50 : Vx.blue300,
                                            repeat: true,
                                            repeatPauseDuration: Duration(milliseconds: 100),
                                            showTwoGlows: true,
                                              child: InkWell(
                                                splashColor: Vx.blue700,
                                                child: Container(
                                                  height: 60,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [kprimarycolor,ksecondarycolor],
                                                      begin: FractionalOffset(0.0,0.0),
                                                      end: FractionalOffset(0.5,0.0),
                                                      stops: [0.0,1.0],
                                                      tileMode: TileMode.clamp
                                                    ),
                                                    borderRadius: BorderRadius.circular(20),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children:[
                                                      Spacer(),
                                                    Text("Sign In",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)),
                                                      Spacer(),
                                                      Icon(Icons.arrow_forward_outlined, size: 30,color: Colors.white,),

    ],
                                                  ),



                                                ),
                                              ),
                                            ),
                                        ),
                                        ),

                               Row(
                                 children: [
                                  GestureDetector(
                                   onTap: (){

                                   },
                                   child: Padding(
                                     padding: EdgeInsets.only(left: 10),
                                     child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "Register",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontSize: 16,
                                          fontStyle: FontStyle.italic
                                        ),

                                      ),

                              ),
                                   ),
                                 ),
                            Spacer(),

                            GestureDetector(
                              onTap: (){

                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Forgot Password",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic
                                    ),

                                  ),

                                ),
                              ),
                            ),
    ]

    )
                          ]

                ),
    )
    ]
    )
      );
  }
}

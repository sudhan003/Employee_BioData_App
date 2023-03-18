import 'package:digisailor/homepage.dart';

import 'Signup.dart';
import 'colour.dart';
import 'Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'homepagetesting.dart';

class Loginpage extends StatefulWidget {
  const Loginpage ({Key? key}) : super (key:key);
  @override
  LoginpageState  createState() => LoginpageState();

}
class LoginpageState extends State<Loginpage> {

  late String emailid;

  TextEditingController email=TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        backgroundColor: primaryColor,
        title: const Text("Welcome", style: TextStyle(color: Colors.black,
        ),),
      ),
      resizeToAvoidBottomInset: true,
      body:GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SingleChildScrollView(
                child: Stack(
                  children: <Widget> [
                    Image.asset(bgimage,
                      fit: BoxFit.cover,),
                  Center(
                      child: Image.asset(avatar,fit: BoxFit.fitWidth,width: 300,height: 180),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10, MediaQuery.of(context).size.height * 0.25, MediaQuery.of(context).size.width *0.2, 0,),


                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors:[
                                  primaryColor.withOpacity(0.1),
                                  Colors.white]

                            ),
                            border: const Border(
                              left: BorderSide(color: primaryColor,width:3,style: BorderStyle.solid),


                            )
                        ),
                        child:const Text("  $loginString",
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,),),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, MediaQuery.of(context).size.height * 0.35, 10, 0),
                        child:TextField(
                          controller: email,


                          decoration: const InputDecoration(
                              labelText:"EMAIL ADDRESS",
                              labelStyle: TextStyle(color: primaryColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:primaryColor ),
                              ),
                              prefixIcon: Icon(Icons.email_sharp,color: primaryColor)
                          ),
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, MediaQuery.of(context).size.height * 0.48, 10, 0),
                        child:TextFormField(
                          obscureText: _isVisible ,
                          controller: confirmpassword,
                          validator: (confirmpassword) {
                            if (confirmpassword == null || confirmpassword.isEmpty) {
                              return 'Password Required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                icon: _isVisible ? const Icon( Icons.visibility,color: primaryColor) : const Icon( Icons.visibility_off,color: primaryColor),
                              ),
                              labelText:"PASSWORD",
                              labelStyle: const TextStyle(color: primaryColor),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:  BorderSide(color:primaryColor ),
                              ),
                              prefixIcon: const Icon(Icons.lock,color: primaryColor)
                          ),
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, MediaQuery.of(context).size.height * 0.57, 10, 0),
                        child:Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(onPressed: () {}, child: const Text(forgotText,
                                style:TextStyle(color: Colors.black))
                            ))
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, MediaQuery.of(context).size.height * 0.65, 10, 0),
                        child:Align(
                            alignment: Alignment.center,
                            child:SizedBox(
                                height: height* 0.08,
                                width: width-30,
                                child: TextButton(
                                    onPressed: () {
                                      emailid = email.text;
                                      FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: confirmpassword.text).then((value) {
                                        Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => Homepage(emailid: emailid)));
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                     backgroundColor: primaryColor,
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),),
                                    child: const Text(logText,
                                  style: TextStyle(
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.bold,fontSize: 26,color: Colors.black),
                                )

                                )))
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(60, MediaQuery.of(context).size.height * 0.75, 10, 0),
                      child: Row(
                        children: <Widget>[
                          const Text("Don't have an account"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>Signup()));
                              }, child: const Text("Create Account",
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.bold,color: primaryColor)
                          )
                          ),
                        ],
                      ),
                    ),
                  ],

                ),
              ),

            ],

          ),
        ),
      ),
    );
  }
}

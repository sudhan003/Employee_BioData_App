

import 'package:digisailor/Loginpage.dart';
import 'package:digisailor/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Home.dart';
import 'colour.dart';

import 'package:flutter/material.dart';
import 'constants.dart';

class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignupState();
  }
}
class SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool  _isVisible1 = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        backgroundColor: primaryColor,
        title: Text("Create Your Account", style: TextStyle(color: Colors.black,
        ),),
      ),
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SingleChildScrollView(
                  child: Stack(
                    children: <Widget> [
                      Image.asset(bgimage,
                          fit: BoxFit.cover),


                      Padding(
                        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * 0.05, 0, 0, 0,),
                        child: Image.asset(avatar,fit: BoxFit.fitWidth,width: 300,height: 150),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(10, MediaQuery.of(context).size.height * 0.2, MediaQuery.of(context).size.width *0.2, 0,),


                        child: Container(
                          child:Text("  $signString",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 26,),),

                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors:[
                                    primaryColor.withOpacity(0.1),
                                    Colors.white]

                              ),
                              border: Border(
                                left: BorderSide(color: primaryColor,width:3,style: BorderStyle.solid),


                              )
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, MediaQuery.of(context).size.height * 0.3, 10, 0),
                          child:TextFormField(
                            controller: name,
                            validator: (name){
                              if (name!.isEmpty) {

                                return 'Name is Required';
                              }
                              if (!RegExp(r"[a-z A-Z]")
                                  .hasMatch(name)) {
                                return 'Please enter a valid email Address';
                              }
                              return null;
                            },

                            decoration: const InputDecoration(
                                labelText:"NAME",
                                labelStyle: TextStyle(color: primaryColor),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color:primaryColor ),
                                ),
                                prefixIcon: Icon(Icons.person,color: primaryColor)
                            ),
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, MediaQuery.of(context).size.height * 0.43, 10, 0),
                          child:TextFormField(
                            controller: email,
                            validator: (email){
                              if (email!.isEmpty) {

                                return 'Email is Required';
                              }
                              if (!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                  .hasMatch(email)) {
                                return 'Please enter a valid email Address';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText:"EMAIL ADDRESS",
                                labelStyle: TextStyle(color: primaryColor),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color:primaryColor ),
                                ),
                                prefixIcon: Icon(Icons.mail,color: primaryColor)
                            ),
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, MediaQuery.of(context).size.height * 0.56, 10, 0),
                          child:TextFormField(
                            controller: password,
                            validator: (password){
                              if (password!.isEmpty) {
                                return 'Password is Required';
                              } else if (password.length<8) {
                                return '"atleast 8 characters"';
                              }
                              return null;
                            },
                            obscureText: _isVisible1,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isVisible1 = !_isVisible1;
                                    });
                                  },
                                  icon: _isVisible1 ? Icon( Icons.visibility_off,color: primaryColor) : Icon( Icons.visibility,color: primaryColor),
                                ),
                                labelText:"PASSWORD",
                                labelStyle: TextStyle(color: primaryColor),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color:primaryColor ),
                                ),
                                prefixIcon: Icon(Icons.lock,color: primaryColor)
                            ),
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, MediaQuery.of(context).size.height * 0.69, 10, 0),
                          child:TextFormField(
                            controller: confirmpassword,
                            obscureText: !_isVisible,
                            validator: (confirmpassword){
                              if (confirmpassword!.isEmpty) {
                                return 'Re-enter Password';
                              }
                             if (password.text != confirmpassword) {
                                return "Password not matched";
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
                                  icon: _isVisible ? Icon( Icons.visibility,color: primaryColor) : Icon( Icons.visibility_off,color: primaryColor),
                                ),
                                labelText:"CONFIRM PASSWORD",
                                labelStyle: const TextStyle(color: primaryColor),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color:primaryColor ),
                                ),
                                prefixIcon: Icon(Icons.lock,color: primaryColor)
                            ),
                          )
                      ),

                      Padding(
                          padding: EdgeInsets.fromLTRB(10, MediaQuery.of(context).size.height * 0.8, 10, 50),
                          child:Align(
                              alignment: Alignment.center,
                              child:SizedBox(
                                  height: height* 0.08,
                                  width: width-30,
                                  child: FlatButton(
                                      color: primaryColor,
                                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                      onPressed: () {
                                        FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: confirmpassword.text).then((value) => {

                                          Navigator.push(context, 
                                       MaterialPageRoute(builder: (context)=> Loginpage()))
                                        });

                                      },
                                      child: const Text(signText,
                                        style: TextStyle(
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.bold,fontSize: 26,color: Colors.black),
                                      )

                                  )))
                      ),

                    ],

                  ),
                ),

              ],

            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digisailor/homepage.dart';
import 'package:digisailor/profileedit.dart';
import 'package:digisailor/profileview.dart';
import 'Loginpage.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homepagetesting.dart';



class MyDrawer extends StatefulWidget {
  String emailid;

  MyDrawer({required this.emailid});

@override
  State<MyDrawer> createState() => _MyDrawerState(emailid);
}

class _MyDrawerState extends State<MyDrawer> {
  String emailid;
  _MyDrawerState(this.emailid);
  @override

  // Future getdoc() async{
  //   DocumentSnapshot<Map<String, dynamic>> document = await FirebaseFirestore
  //       .instance
  //       .collection('profile')
  //       .doc(emailid)
  //       .get();
  //   if(document.exists)
  //   {
  //     Navigator.push(context,MaterialPageRoute(builder: (context) => profview(emailid: emailid)));
  //     print(emailid);
  //     print('exists');
  //   }
  //   else {
  //     print(emailid);
  //     print('not exists');
  //     Navigator.push(context, MaterialPageRoute(
  //         builder: (context) => profile(emailid: emailid,)));
  //   }
  // }
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
      Container(

        width: double.infinity,
      margin: EdgeInsets.only(bottom: 15),

      height: 250,
      decoration: const BoxDecoration(
        color: Colors.black,
          image: DecorationImage(
          image: AssetImage(avatar1),
      ),
    ),
    ),

          ListTile(

            leading: Icon(Icons.person,size: 40,),
            title: Text('Profile',style: TextStyle(color: Colors.black,fontSize: 20),),
           onTap: () async {
              // getdoc();
             // QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("collection").getDocuments();
             DocumentSnapshot<Map<String, dynamic>> document = await FirebaseFirestore
                 .instance
                 .collection('profile')
                 .doc(emailid)
                 .get();
             // if(document.exists)
             // {
             //   Navigator.push(context,MaterialPageRoute(builder: (context) => profview(emailid: emailid, docid: null,)));
             //   print(emailid);
             //   print('exists');
             // }
             // else {

               print(emailid);
               print('not exists');
               Navigator.push(context, MaterialPageRoute(
                   builder: (context) => profile(emailid: emailid,)));
             // }
            // Navigator.push(context, MaterialPageRoute(builder: (context) => profile(emailid: emailid)));
           },
          ),
          ListTile(
            leading: Icon(Icons.home,size: 40,),
            title: Text('Home',style: TextStyle(color: Colors.black,fontSize: 20),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Homepage(emailid: emailid)));
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail,size: 40,),
            title: Text('contact',style: TextStyle(color: Colors.black,fontSize: 20),),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.feedback,size: 40,),
            title: Text('Feedback',style: TextStyle(color: Colors.black,fontSize: 20),),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.settings,size: 40,),
            title: Text('Settings',style: TextStyle(color: Colors.black,fontSize: 20),),
            onTap: () => null,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Align(
                alignment: Alignment(0,20),
                child: ElevatedButton(
                  child: Text("Log Out"),
                  onPressed: (){
                    FirebaseAuth.instance.signOut().then((value) =>
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> Loginpage())
                   ));
                  }

                )
            ),
          ),
        ],
      ),
    );
  }
}
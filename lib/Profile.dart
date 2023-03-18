// import 'package:digisailor/Signup.dart';
// import 'package:digisailor/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'colour.dart';
// import 'MyDrawer.dart';
// import 'Loginpage.dart';
//
// enum menu { first, sec }
//
// class Profile extends StatefulWidget {
//   const Profile ({Key? key}) : super(key: key);
//
//   @override
//  State createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   TextEditingController name = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery
//         .of(context)
//         .size
//         .height;
//     double width = MediaQuery
//         .of(context)
//         .size
//         .width;
//     return Scaffold(
//       drawer: MyDrawer(),
//       appBar: AppBar(
//         backgroundColor: Theme
//             .of(context)
//             .scaffoldBackgroundColor,
//         elevation: 1,
//         title: const Text('Profile', style: TextStyle(color: primaryColor),),
//
//         leading: Builder(builder: (BuildContext context) {
//           return IconButton(
//             tooltip: MaterialLocalizations
//                 .of(context)
//                 .openAppDrawerTooltip,
//             icon: const Icon(Icons.menu, color: primaryColor,),
//             onPressed: () => Scaffold.of(context).openDrawer(),
//           );
//         },
//         ),
//
//         actions: [ PopupMenuButton(
//             offset: const Offset(0.0, 60.0),
//             icon: new Icon(
//                 FontAwesomeIcons.ellipsisVertical, color: primaryColor),
//             color: Colors.white,
//             onSelected: (result) {
//               if (result == menu.first) {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => Loginpage()));
//               }
//               if (result == menu.sec) {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => Signup()));
//               }
//             },
//             itemBuilder: (BuildContext context) =>
//             <PopupMenuEntry<menu>>[
//               const PopupMenuItem<menu>(
//                 value: menu.first,
//                 child: ListTile(
//                   leading: Icon(Icons.login, color: primaryColor, size: 23,),
//                   title: Text('Signin',
//                     style: TextStyle(color: primaryColor, fontSize: 20,),),
//                 ),
//               ),
//               PopupMenuItem<menu>(
//
//                 value: menu.first,
//                 child: ListTile(
//                   leading: Icon(Icons.logout, color: primaryColor, size: 23,),
//                   title: Text('Logout',
//                     style: TextStyle(color: primaryColor, fontSize: 20),),
//                 ),
//               )
//             ]
//         ),
//         ],
//         //   PopupMenuButton(
//         //       offset: const Offset(0.0, 60.0),
//         //       icon: new Icon(FontAwesomeIcons.ellipsisVertical, color: primaryColor),
//         //       onSelected: (result) {
//         //         if (result == 0) {
//         //           Navigator.of(context)
//         //               .push(
//         //               MaterialPageRoute(builder: (context) => Loginpage()));
//         //         }
//         //       },
//         //         itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
//         //           PopupMenuItem<String>(
//         //
//         //               child: Container(
//         //               color: Colors.white,
//         //
//         //               child: Column(
//         //               children: <Widget>[
//         //               new Row(
//         //               children: <Widget>[
//         //               new  ElevatedButton.icon(
//         //                   onPressed: () {},
//         //                   style: ElevatedButton.styleFrom(
//         //                     primary: Colors.white, // Background color
//         //                     onPrimary: primaryColor, // Text Color (Foreground color)
//         //                   ),
//         //                   icon: Icon( // <-- Icon
//         //                     Icons.logout,color: primaryColor,
//         //                     size: 24.0,
//         //                   ),
//         //                   label: Text('Logout',), // <-- Text
//         //                 ),
//         //         ]
//         //               ),
//         //                 new Row(
//         //                     children: <Widget>[
//         //                       new  ElevatedButton.icon(
//         //                         onPressed: () {},
//         //                         style: ElevatedButton.styleFrom(
//         //                           primary: Colors.white, // Background color
//         //                           onPrimary: primaryColor, // Text Color (Foreground color)
//         //                         ),
//         //                         icon: Icon( // <-- Icon
//         //                           Icons.logout,color: primaryColor,
//         //                           size: 24.0,
//         //                         ),
//         //                         label: Text('Logout',), // <-- Text
//         //                       ),
//         //
//         //                     ]
//         //
//         //                 ),
//         //
//         //             ],
//         //           ))),
//         //
//         //       ],
//         // )
//
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 16, top: 25, right: 16),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//               children: [
//                 Text(
//                   "Edit Profile",
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Center(
//                   child: Stack(
//                       children: [
//                         Container(
//                             width: 130,
//                             height: 130,
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                     width: 4,
//                                     color: Theme
//                                         .of(context)
//                                         .scaffoldBackgroundColor),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       spreadRadius: 2,
//                                       blurRadius: 10,
//                                       color: Colors.black.withOpacity(0.1),
//                                       offset: Offset(0, 10))
//                                 ],
//                                 shape: BoxShape.circle,
//                                 image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image: AssetImage(profilepic),
//                                 ))),
//                         Positioned(
//                             bottom: 0,
//                             right: 0,
//                             child: Container(
//                               height: 40,
//                               width: 40,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       width: 4,
//                                       color: Theme
//                                           .of(context)
//                                           .scaffoldBackgroundColor),
//                                   shape: BoxShape.circle,
//                                   color: primaryColor
//                               ),
//                               child: Icon(Icons.edit, color: Colors.white,),
//
//                             ))
//                       ]
//                   ),
//                 ),
//                 SizedBox(height: 35,),
//                 buildTextfield('Full name',"name"),
//                 buildTextfield("Email id",'email' ),
//                 buildTextfield1("About",'about'),
//                 SizedBox(height: 50,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 OutlinedButton(
//                     style: OutlinedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 50),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
//                     ),
//                     onPressed: (){},
//                     child: Text('Cancel',
//                     style: TextStyle(color:Colors.black,fontSize: 14,
//                     letterSpacing: 2.2
//                     ),)),
//                 RaisedButton(color: primaryColor,
//                    padding: EdgeInsets.symmetric(horizontal: 50),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
//                   elevation: 2  ,
//                   onPressed: (){},
//                   child: Text('Save',
//                   style: TextStyle(
//                       color: Colors.white,
//                        fontSize: 14,
//                   letterSpacing: 2.2),),)
//               ],
//       ),
//               ]
//           ),
//         ),),
//     );
//   }
//     Widget buildTextfield(String labelText,String placeholder) {
//        return Padding(
//           padding: const EdgeInsets.only(bottom: 35.0),
//       child: TextField(
//         decoration: InputDecoration(border:OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(color:primaryColor)
//         ),focusColor:primaryColor,focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(color: primaryColor)),
//             contentPadding: EdgeInsets.only(left: 10, bottom: 3,top: 5),
//             labelText: labelText,
//             labelStyle: TextStyle(
//                 color: primaryColor
//             ),
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             hintText: placeholder
//         ),
//       ),
//       );
//     }
//   Widget buildTextfield1(String labelText,String placeholder) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 35.0),
//       child: TextField(maxLines: 4,
//         decoration: InputDecoration(
//             border:OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(color:primaryColor)
//             ),contentPadding: const EdgeInsets.only(left:10,top: 10), focusColor:primaryColor,focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(color: primaryColor,)),
//
//             labelText: labelText,
//             labelStyle: const TextStyle(
//
//                 color: primaryColor
//             ),
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             hintText: placeholder
//         ),
//       ),
//     );
//   }
//
// }

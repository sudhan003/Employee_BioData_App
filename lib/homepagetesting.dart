// import 'package:digisailor/addpage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'editpage.dart';
// import 'Loginpage.dart';
// import 'MyDrawer.dart';
// import 'colour.dart';
// import 'dart:io';
//
//
// class Homepage extends StatefulWidget {
//
//   String emailid;
//   @override
//   Homepage({required this.emailid});
//   _HomepageState createState() => _HomepageState(emailid);
// }
//
// class _HomepageState extends State<Homepage> {
//
//   String emailid;
//   _HomepageState(this.emailid);
//
//   final Stream<DocumentSnapshot<Map<String, dynamic>>> _usersStream =
//   FirebaseFirestore.instance.collection('biodata').doc('emailid').snapshots();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: CupertinoColors.white,
//         onPressed: () {
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (_) =>addpage(emailid: emailid,)));
//         },
//         child: Icon(
//           Icons.add, color: primaryColor,
//           size: 30,
//         ),
//       ),
//       drawer:MyDrawer(emailid: emailid),
//       appBar: AppBar(
//         backgroundColor: CupertinoColors.white,
//         title: const Text('Home ',style: TextStyle(color: primaryColor),),
//
//         leading:Builder(builder: (BuildContext context) {
//           return IconButton(
//             tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//             icon:  Icon(Icons.menu,color: primaryColor,),
//             onPressed: ()  => Scaffold.of(context).openDrawer(),
//           );},
//         ),
//
//         actions: [IconButton(onPressed: (){
//           PopupMenuButton(onSelected: (result) {
//             if (result == 0) {
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (context) => Loginpage()));
//             }
//           }, itemBuilder: (BuildContext context) {
//             return [
//               const PopupMenuItem(
//                 value: 0, //---add this line
//                 child: Text('Logout'),
//               ),
//             ];
//           });
//         }, icon: Icon(Icons.more_vert,color: primaryColor,))
//         ],
//       ),
//       body: StreamBuilder(
//         stream: _usersStream,
//         builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>snapshot) {
//           if (snapshot.hasError) {
//             return Text("something is wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: Colors.black,
//               ),
//             );
//           }
//
//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: ListView.builder(
//               itemCount: snapshot.data!.,
//               itemBuilder: (_, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) =>
//                             editnote(docid: snapshot.data!.get(index), emailid: emailid,),
//                       ),
//                     );
//                   },
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: 10,
//                           right: 10,
//                         ),
//                         child: ListTile(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             side: BorderSide(
//                               color: primaryColor,
//                               width: 3,
//                             ),
//                           ),
//                           leading: CircleAvatar(
//                             backgroundColor: primaryColor,
//                             radius: 35,
//                             child: ClipOval(
//                               child:SizedBox(
//                                 height: 50,
//                                 width: 50,
//                                 child:Image.network("https://images.unsplash.com/photo-1666289793297-aa8400bac103?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
//                                   fit: BoxFit.cover,),
//                               ),
//                             ),
//                           ),
//                           title:Text(
//                             snapshot.data!.get('name'),
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           subtitle: Text(
//                             snapshot.data!.get('email'),
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                             vertical: 12,
//                             horizontal: 16,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// class pop extends StatelessWidget {
//   const pop({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: PopupMenuButton(onSelected: (result) {
//         if (result == 0) {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => Loginpage()));
//         }
//       }, itemBuilder: (BuildContext context) {
//         return [
//           const PopupMenuItem(
//             value: 0, //---add this line
//             child: Text('Logout'),
//           ),
//         ];
//       }
//       ),
//     );
//   }
// }

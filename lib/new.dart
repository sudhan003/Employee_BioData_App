// import 'package:digisailor/MyDrawer.dart';
// import 'package:digisailor/colour.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'Loginpage.dart';
// import 'dart:io';
// import 'dart:async';
// import 'package:path/path.dart';
// import 'package:image_picker/image_picker.dart';
// class New extends StatefulWidget {
//   String emailid;a
//   @override
//   New({required this.emailid});
//   State<New> createState() => _NewState( emailid: 'emailid');
// }
//
// class _NewState extends State<New> {
//   String emailid;
//   _NewState({required this.emailid}){}
//   late File? _image = null;
//
//   Future getImage () async{
//     File image;
//     image = (await ImagePicker().pickImage(source: ImageSource.camera)) as File;
//
//     setState(() {
//       _image = image;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: MyDrawer(),
//
//       //AppBor
//
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text("Profile",
//         style: TextStyle(color: primaryColor),),
//         leading:Builder(builder: (BuildContext context) {
//           return IconButton(
//             tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//             icon: const Icon(Icons.menu,
//             color: primaryColor,),
//             onPressed: ()  => Scaffold.of(context).openDrawer(),
//           );},
//         ),
//
//         actions: [ PopupMenuButton(onSelected: (result) {
//           if (result == 0) {
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (context) => Loginpage()));
//           }
//         }, itemBuilder: (BuildContext context) {
//           return [
//             const PopupMenuItem(
//               value: 0, //---add this line
//               child: Text('Logout'),
//             ),
//           ];
//         }),
//         ],
//       ),
//       body:
//           Stack(
//             Column(
//               children: [
//                 // SizedBox(height: 50,),
//                 Center(
//
//                   //Profile Picture widget
//                   child: Container(
//                     child: CircleAvatar(radius: 90,
//                     backgroundColor: primaryColor,
//                     child: ClipOval(
//                       // radius: 65 ,
//                       child:SizedBox(
//                         height: 160,
//                       width: 160,
//                       child:Image.network("https://media.istockphoto.com/photos/profile-icon-picture-id1307513922?b=1&k=20&m=1307513922&s=170667a&w=0&h=4nuyyJQrsg2aLxB5YMjO3H4Cft__ux0M2djieds-bIc=",
//                           fit: BoxFit.fitHeight,
//                     ),),),
//                   ),
//                 ),
//                 )],
//
//
//          child: RawMaterialButton(onPressed: (){
//               showDialog(
//                   context: context, builder: (BuildContext){
//                 return AlertDialog(
//                   title: Text('Choose option',style: TextStyle(fontWeight: FontWeight.w600),),
//                 content:SingleChildScrollView(
//                   child: ListBody(
//                     children: [
//                   InkWell(
//                     splashColor: primaryColor,
//                   child: Row(
//                     children: [
//                 ElevatedButton(
//                   onPressed: (){
//                     getImage();
//                   },
//                   child: Row(children: [Icon(Icons.camera_alt,color: Colors.black,),SizedBox(width: 25,),Text('Camera',style: TextStyle(
//                   color: Colors.black,fontWeight: FontWeight.w500,fontSize: 30
//                 ),)],),
//                   style: ElevatedButton.styleFrom(primary: Colors.white),)
//                   ],
//                   crossAxisAlignment: CrossAxisAlignment.center,),),
//                   InkWell(
//                     splashColor: primaryColor,
//                     child: Row(
//                       children: [
//                         ElevatedButton(
//                           onPressed: ()  async{
//                           print('worked');
//                           final results = await FilePicker.platform.pickFiles(
//                           allowMultiple: false,
//                               type: FileType.custom,
//                               allowedExtensions: ['png','jpg','jpeg']
//                           );
//                           if(results == null){
//                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No file selected')));
//                           }
//                           },
//                           child:Row(
//                             children: [
//                               Icon(Icons.image,color: Colors.black,),
//                               SizedBox(width:25 ,),
//                               Text('Gallery',
//                                 style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)],) ,
//                           style: ElevatedButton.styleFrom(primary: Colors.white),)
//                       ],
//                       crossAxisAlignment: CrossAxisAlignment.center,),),
//                       InkWell(
//                         splashColor: primaryColor,
//                         child: Row(
//                           children: [
//                             ElevatedButton(
//                               onPressed: (){}, child: Row(children: [Icon(Icons.remove_circle,color: Colors.red,),
//                             SizedBox(width: 25,),
//                             Text('Remove',style: TextStyle(fontWeight: FontWeight.w600),),],)
//                              )
//                           ],
//                           crossAxisAlignment: CrossAxisAlignment.center,),)
//                 ],),
//                 ),);
//               });
//             },
//                 elevation: 10,
//               fillColor: Colors.green,
//               child:Icon(Icons.add_a_photo ) ,
//               padding: EdgeInsets.all(15.0),
//               shape: CircleBorder(),
//             ),
//
//             ),
//           )
//     );
//   }
// }

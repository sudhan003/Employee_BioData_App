// import 'package:digisailor/Profile.dart';
// import 'package:digisailor/main.dart';
// import 'package:digisailor/profileedit.dart';
// import 'Homey.dart';
// import 'Home.dart';
// import 'Signup.dart';
// import 'new.dart';
// import 'Loginpage.dart';
// import 'MyDrawer.dart';
// import 'package:flutter/material.dart';
// import 'colour.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   int currentIndex = 1;
//   final screens =[
//     Homey(),
//     // profile(emailid: '',),
//   ];
//   @override
//   Widget build(BuildContext context)=>  Scaffold(
//
//
//     body: IndexedStack(
//       index: currentIndex,
//       children: screens,
//     ),
//       bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//           selectedItemColor: primaryColor,
//           unselectedItemColor: primaryColor,
//           selectedFontSize: 19,
//           unselectedFontSize: 15,
//          iconSize: 25,
//          showUnselectedLabels: true,
//          currentIndex: currentIndex,
//           onTap: (index)=>setState(() => currentIndex = index),
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home,),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person,),
//               label:'Profile',
//             )
//           ],
//         ),
//     );
//   }

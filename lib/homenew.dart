import 'package:digisailor/Confirmpage.dart';
import 'package:digisailor/Showpage.dart';
import 'package:flutter/material.dart';
import 'Showpage.dart';
import 'package:digisailor/MyDrawer.dart';
class homenew extends StatefulWidget {
  const homenew({Key? key}) : super(key: key);

  @override
  State<homenew> createState() => _homenewState();
}

class _homenewState extends State<homenew> {
  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(

       title: Text("begin"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.more_vert), onPressed: () {  } ,
          ),
        ],
      ),
   body:
     Center(child: Text("he")),
   floatingActionButton: FloatingActionButton(
     child:Icon(Icons.add),
     onPressed: () {
       Navigator.of(context)
           .push(MaterialPageRoute(builder: (context) => Confirmpage()));
     },
   )
    );
  }
}

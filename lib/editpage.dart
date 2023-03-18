import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digisailor/colour.dart';
import 'package:digisailor/homepage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import 'homepagetesting.dart';

class editnote extends StatefulWidget {
  String emailid;
  DocumentSnapshot docid;
  editnote({required this.docid,required this.emailid});


  @override
  _editnoteState createState() => _editnoteState(emailid);
}

class _editnoteState extends State<editnote> {

  String emailid;
  _editnoteState(this.emailid);


  TextEditingController name  = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController lknown = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController  nationality= TextEditingController();
  TextEditingController Qualify = TextEditingController();
  TextEditingController  jobtitl= TextEditingController();
  TextEditingController  experience= TextEditingController();
  // TextEditingController url = TextEditingController();
  @override
  void initState() {
    name = TextEditingController(text: widget.docid.get('name'));
    email = TextEditingController(text: widget.docid.get('email'));
    phone = TextEditingController(text: widget.docid.get('phone'));
    dob = TextEditingController(text: widget.docid.get('dob'));
    address = TextEditingController(text: widget.docid.get('address'));
    lknown = TextEditingController(text: widget.docid.get('lknown'));
    gender = TextEditingController(text: widget.docid.get('gender'));
    nationality = TextEditingController(text: widget.docid.get('nationality'));
    Qualify = TextEditingController(text: widget.docid.get('Qualify'));
    jobtitl = TextEditingController(text: widget.docid.get('jobtitl'));
    experience = TextEditingController(text: widget.docid.get('experience'));
    url =  widget.docid.get('url') as String;

    super.initState();
  }

  late String results;
  PlatformFile? image;
  Future pickImage(ImageSource source) async{
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','jpeg','png']
    );
    if (result == null){
      return ScaffoldMessenger(
          child: Text('select image')
      );
    }
    setState(()=> {
      image = result.files.first
    });
  }

  String url='';
  Future uploadImage() async{
    final path = 'bfiles/${image!.name}';
    final bfiles = File(image!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    await ref.putFile(bfiles);
    url= await ref.getDownloadURL();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading:  IconButton(onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Homepage(emailid: '',)
              )
          );
        }, icon: Icon(Icons.arrow_back,color: primaryColor,),
        ),
        actions:<Widget> [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'name': name.text,
                'email': email.text,
                'phone': phone.text,
                'dob': dob.text,
                'address': address.text,
                'lknown': lknown.text,
                'gender': gender.text,
                'nationality': nationality.text,
                'Qualify': Qualify.text,
                'jobtitl': jobtitl.text,
                'experience': experience.text,
                 // 'url': url,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Homepage(emailid: '',)));
              });
            },
            child: Text("save"),
            color: primaryColor,
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Homepage(emailid: '',)));
              });
            },
            child: Text("delete"),
          color: Colors.red,
          ),

        ],
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.only(left: 10.0,top:20.0,right: 10.0),
          child: Container(
            child: Column(
              children: [
                Stack(
                 children:[
                 Container(
                     child: CircleAvatar(
                       radius: 85,
                       backgroundColor: primaryColor,
                       child: ClipOval(
                         child:SizedBox(
                           height: 160.0,
                           width: 160.0,
                           child:
                           // image  != null? Image.file(
                           //   File(image!.path!),
                           // ):
                           Image.network("https://tse2.mm.bing.net/th?id=OIP.ANBtqtE3FBxuRPVc1n5qhAHaJ4&pid=Api&P=0",
                             fit: BoxFit.cover,),
                         ),
                       ),
                     ),
                 ),
                   Positioned(
                     right: 10,
                     bottom: 10,
                     child:InkWell(
                       child: Container(
                         height: 50,
                         width: 50,
                         child: Icon(Icons.add_a_photo,
                           color: Colors.white,
                           size: 25,
                         ),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(100),
                             color: primaryColor
                         ),
                       ),
                       onTap: () {
                         showDialog(
                             context: context, builder: (BuildContext){
                           return SimpleDialog(
                             title: Text("Choose"),
                             children: <Widget>[
                               TextButton.icon(
                                 icon: Icon(Icons.camera_alt,
                                   color: primaryColor
                                   ,),
                                 onPressed: () async {
                                 },
                                 label: Text("Camera",
                                   style: TextStyle(
                                       color: primaryColor,
                                       fontSize: 20
                                   ),
                                 ),
                               ),
                               TextButton.icon(
                                   onPressed: () async{
                                     pickImage(ImageSource.gallery);
                                   },
                                   icon: Icon(Icons.photo
                                     ,color: primaryColor,),
                                   label: Text("Gallery",
                                     style: TextStyle(
                                         color: primaryColor,
                                         fontSize: 20),
                                   )
                               ),
                               TextButton.icon(
                                   onPressed: (){
                                   },
                                   icon: Icon(Icons.remove_circle_outlined,
                                     color: Colors.red,),
                                   label: Text("Remove",
                                     style: TextStyle(color: Colors.red,
                                         fontSize: 20),
                                   )
                               ),
                             ],
                           );
                         }
                         );
                       },
                     ) ,
                   )
                 ]
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      prefixIcon:Icon(Icons.person) ,
                      hintText: 'name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                 Container(

                    child: TextField(
                      controller: email,

                      maxLines: null,
                      decoration: InputDecoration(border: OutlineInputBorder(),
                        prefixIcon:Icon(Icons.email_outlined) ,
                        hintText: 'email',
                      ),
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextField(
                    controller: phone,

                    maxLines: null,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      prefixIcon:Icon(Icons.phone_outlined) ,
                      hintText: 'Phone no',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextField(
                    controller: dob,

                    maxLines: null,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      prefixIcon:Icon(Icons.date_range_outlined) ,
                      hintText: 'content',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextField(
                    controller: address,

                    maxLines: null,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      prefixIcon:Icon(Icons.location_on_outlined) ,
                      hintText: 'content',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextField(
                    controller: lknown,

                    maxLines: null,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      prefixIcon:Icon(Icons.language_outlined) ,
                      hintText: 'content',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextField(
                    controller: gender,

                    maxLines: null,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      prefixIcon:Icon(Icons.person_search_outlined) ,
                      hintText: 'content',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextField(
                    controller: nationality,

                    maxLines: null,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      prefixIcon:Icon(Icons.flag) ,
                      hintText: 'content',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextField(
                    controller: Qualify,

                    maxLines: null,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      prefixIcon:Icon(Icons.menu_book_outlined) ,
                      hintText: 'content',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextField(
                    controller: jobtitl,

                    maxLines: null,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      prefixIcon:Icon(Icons.work_outline) ,
                      hintText: 'content',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextField(
                    controller: experience,

                    maxLines: null,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      prefixIcon:Icon(Icons.work_history_outlined) ,
                      hintText: 'content',
                    ),
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
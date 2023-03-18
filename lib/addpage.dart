import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:digisailor/colour.dart';
import 'package:digisailor/homepage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'homepagetesting.dart';

class addpage extends StatefulWidget {
  String emailid;
  @override
  addpage({required this.emailid});
  _addpageState createState() => _addpageState(emailid);
}

class _addpageState extends State<addpage> {
  String emailid;
  _addpageState(this.emailid);

  String url = '';
  late String Name;
  late String Email;
  late String Phone;
  late String Dob;
  late String Add;
  late String Lknown;
  late String Gend;
  late String Nation;
  late String Quali;
  late String Jobt;
  late String Exp;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController lknown = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController Qualify = TextEditingController();
  TextEditingController jobtitl = TextEditingController();
  TextEditingController experience = TextEditingController();

  PlatformFile? image;
  Future pickImage(ImageSource source) async {
    try {
      final result = await FilePicker.platform.pickFiles(
          type: FileType.custom, allowedExtensions: ['jpg', 'jpeg', 'png']);

      if (result == null) {
        return;
      }
      setState(() => {image = result.files.first});
    } on PlatformException catch (e) {
      print('Fail to pick image:$e');
    }
  }

  UploadTask? uploadTask;
  Future uploadImage() async {
    final path = 'bfiles/${image!.name}';
    final bfiles = File(image!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(bfiles);
    });
    print("working");
    // final url = ref.getDownloadURL();
    final snapshot = await uploadTask?.whenComplete(() {});
    final url = await snapshot?.ref.getDownloadURL();
    print(url);

    setState(() {
      uploadTask = null;
    });
  }

  // CollectionReference ref = FirebaseFirestore.instance.collection('biodata');

  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildPic(BuildContext context) {
    return Stack(children: [
      Container(
          child: CircleAvatar(
        radius: 85,
        backgroundColor: primaryColor,
        child: ClipOval(
          child: SizedBox(
              height: 160.0,
              width: 160.0,
              child: image != null
                  ? Image.file(
                      File(image!.path!),
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      "https://www.bing.com/th?id=OIP.et9QRmS2H-0jipOd2H_MfwHaHe&w=150&h=152&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
                      fit: BoxFit.cover,
                    )),
        ),
      )),
      Positioned(
        right: 10,
        bottom: 10,
        child: InkWell(
          child: Container(
            height: 50,
            width: 50,
            child: Icon(
              Icons.add_a_photo,
              color: Colors.white,
              size: 25,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: primaryColor),
          ),
          onTap: () async {
            showDialog(
                context: context,
                builder: (BuildContext) {
                  return SimpleDialog(
                    title: Text("Choose"),
                    children: <Widget>[
                      TextButton.icon(
                        icon: Icon(
                          Icons.camera_alt,
                          color: primaryColor,
                        ),
                        onPressed: () async {
                          pickImage(ImageSource.camera);
                          Navigator.of(context).pop();
                        },
                        label: Text(
                          "Camera",
                          style: TextStyle(color: primaryColor, fontSize: 20),
                        ),
                      ),
                      TextButton.icon(
                          onPressed: () async {
                            print('worked');
                            pickImage(ImageSource.gallery);
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.photo,
                            color: primaryColor,
                          ),
                          label: Text(
                            "Gallery",
                            style: TextStyle(color: primaryColor, fontSize: 20),
                          )),
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_circle_outlined,
                            color: Colors.red,
                          ),
                          label: Text(
                            "Remove",
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )),
                    ],
                  );
                });
          },
        ),
      )
    ]);
  }

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.person_outline)),
      maxLength: 20,
      controller: name,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.email_outlined)),
      maxLength: 30,
      controller: email,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
    );
  }

  Widget _buildPhone() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Phone No.',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.phone_outlined)),
      maxLength: 10,
      controller: phone,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Phone is Required';
        }

        return null;
      },
    );
  }

  Widget _buildDob() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'DOB',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.date_range_outlined)),
      maxLength: 10,
      controller: dob,
      validator: (value) {
        if (value!.isEmpty) {
          return 'DOB is Required';
        }

        return null;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Address',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.location_on_outlined)),
      maxLength: 30,
      controller: address,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Address is Required';
        }

        return null;
      },
    );
  }

  Widget _buildLknown() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Languages Known',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.language_outlined)),
      maxLength: 30,
      controller: lknown,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Language Known is Required';
        }

        return null;
      },
    );
  }

  Widget _buildGender() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Gender',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.person_search_outlined)),
      maxLength: 10,
      controller: gender,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Gender is Required';
        }

        return null;
      },
    );
  }

  Widget _buildNationality() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Nationality',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.flag_outlined)),
      maxLength: 15,
      controller: nationality,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Nationality is Required';
        }

        return null;
      },
    );
  }

  Widget _buildQualify() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Qualification',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.menu_book_outlined)),
      maxLength: 10,
      controller: Qualify,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Qualification is Required';
        }

        return null;
      },
    );
  }

  Widget _buildJobtitl() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Job',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.work_outline)),
      maxLength: 15,
      controller: jobtitl,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Job is Required';
        }

        return null;
      },
    );
  }

  Widget _buildExperience() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Experience',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.work_history_outlined)),
      maxLength: 15,
      controller: experience,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Experience is Required';
        }

        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Homepage(
                          emailid: '',
                        )));
          },
          icon: Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
        ),
        title: Text(
          "Bio Data",
          style: TextStyle(color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                // margin: EdgeInsets.all(24),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildPic(context),
                        SizedBox(
                          height: 20,
                        ),
                        _buildName(),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildEmail(),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildPhone(),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildDob(),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildAddress(),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildLknown(),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildGender(),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildNationality(),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildQualify(),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildJobtitl(),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildExperience(),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(height: 50),
                        OutlinedButton(
                          onPressed: () {
                            //   // if(!_formKey.currentState!.validate()){
                            //   //   return;
                            //   // }
                            //   ref.add({
                            //     'name': name.text,
                            //     'email': email.text,
                            //     'phone': phone.text,
                            //     'dob': dob.text,
                            //     'address': address.text,
                            //     'lknown': lknown.text,
                            //     'gender': gender.text,
                            //     'nationality': nationality.text,
                            //     'Qualify': Qualify.text,
                            //     'jobtitl': jobtitl.text,
                            //     'experience': experience.text,
                            //   }).whenComplete(() {
                            //     Navigator.pushReplacement(
                            //         context, MaterialPageRoute(builder: (_) => Homepage(emailid: '',)));
                            //   });

                            uploadImage();
                            Name = name.text;
                            Email = email.text;
                            Phone = phone.text;
                            Dob = dob.text;
                            Add = address.text;
                            Lknown = lknown.text;
                            Gend = gender.text;
                            Nation = nationality.text;
                            Quali = Qualify.text;
                            Jobt = jobtitl.text;
                            Exp = experience.text;

                            createdata(Name, Email, Phone, Dob, Add, Lknown,
                                Gend, Nation, Quali, Jobt, Exp, url);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Homepage(emailid: emailid),
                                ));
                          },
                          child: const Text('Submit',
                              style: TextStyle(color: primaryColor)),
                          // buildProgress();
                        ),
                      ],
                    )))),
      ),
    );
    Widget buildProgress() => StreamBuilder<TaskSnapshot>(
        stream: uploadTask?.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            double progress = data.bytesTransferred / data.totalBytes;
            return SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                  ), // Linear Progress Indicator
                  Center(
                    child: Text(
                      '${(100 * progress).roundToDouble()}%',
                      style: const TextStyle(color: Colors.white),
                    ), // Text
                  ), // Center
                ],
              ),
            );
          } else {
            return const SizedBox(height: 50);
          }
        });
  }

  Future<void> createdata(Name, Email, Phone, Dob, Add, Lknown, Gend, Nation,
      Quali, Jobt, Exp, url) async {
    final users =
        await FirebaseFirestore.instance.collection('biodata').doc(emailid);
    final json = await {
      'name': Name,
      'email': Email,
      'phone': Phone,
      'dob': Dob,
      'address': Add,
      'lknown': Lknown,
      'gender': Gend,
      'nationality': Nation,
      'Qualify': Quali,
      'jobtitl': Jobt,
      'experience': Exp,
      'url': url,
    };
    await users.set(json);
  }
}

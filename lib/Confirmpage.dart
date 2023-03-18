import 'package:flutter/material.dart';

import 'Showpage.dart';

class Confirmpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConfirmpageState();
  }
}

class ConfirmpageState extends State<Confirmpage>{


  String _name = '';
  String _email = '';
  String _phone = '';
  String _dob = '';
  String _address = '';
  String _lknown = '';
  String _gender = '';
  String _nationality = '';
  String _Qualify = '';
  String _jobtitl = '';
  String _experience = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name', border: OutlineInputBorder(),prefixIcon:Icon(Icons.person_outline)),
      maxLength: 20,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder(),  prefixIcon:Icon(Icons.email_outlined)),
        maxLength: 30,
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
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  Widget _buildPhone() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone No.', border: OutlineInputBorder(),  prefixIcon:Icon(Icons.phone_outlined)),
      maxLength: 10,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Phone is Required';
        }

        return null;
      },
      onSaved: (value) {
        _phone = value!;
      },
    );
  }



  Widget _buildDob() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'DOB', border: OutlineInputBorder(),  prefixIcon:Icon(Icons.date_range_outlined)),
      maxLength: 10,
      validator: (value) {
        if (value!.isEmpty) {
          return 'DOB is Required';
        }

        return null;
      },
      onSaved: (value) {
        _dob = value!;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Address', border: OutlineInputBorder(),  prefixIcon:Icon(Icons.location_on_outlined)),
      maxLength: 30,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Address is Required';
        }

        return null;
      },
      onSaved: (value) {
        _address = value!;
      },
    );
  }

  Widget _buildLknown() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Languages Known', border: OutlineInputBorder(),  prefixIcon:Icon(Icons.language_outlined)),
      maxLength: 30,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Language Known is Required';
        }

        return null;
      },
      onSaved: (value) {
        _lknown = value!;
      },
    );
  }

  Widget _buildGender() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Gender', border: OutlineInputBorder(),  prefixIcon:Icon(Icons.person_search_outlined)),
      maxLength: 10,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Gender is Required';
        }

        return null;
      },
      onSaved: (value) {
        _gender = value!;
      },
    );
  }

  Widget _buildNationality() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nationality', border: OutlineInputBorder(),  prefixIcon:Icon(Icons.flag_outlined)),
      maxLength: 15,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Nationality is Required';
        }

        return null;
      },
      onSaved: (value) {
        _nationality = value!;
      },
    );
  }

  Widget _buildQualify() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Qualification', border: OutlineInputBorder(),  prefixIcon:Icon(Icons.menu_book_outlined)),
      maxLength: 10,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Qualification is Required';
        }

        return null;
      },
      onSaved: (value) {
        _Qualify = value!;
      },
    );
  }

  Widget _buildJobtitl() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Job', border: OutlineInputBorder(),  prefixIcon:Icon(Icons.work_outline)),
      maxLength: 15,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Job is Required';
        }

        return null;
      },
      onSaved: (value) {
        _jobtitl = value!;
      },
    );
  }

  Widget _buildExperience() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Experience', border: OutlineInputBorder(),  prefixIcon:Icon(Icons.work_history_outlined)),
      maxLength: 15,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Experience is Required';
        }

        return null;
      },
      onSaved: (value) {
        _experience = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text("Bio Data")),
        body: SingleChildScrollView(
          child:Container(
           child: Padding(
             padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

              // margin: EdgeInsets.all(24),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                      _buildAddress(),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildDob(),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildGender(),
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
                      _buildNationality(),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildLknown(),
                      const SizedBox(
                        height: 10,
                      ),

                      SizedBox(height: 50),
                  OutlinedButton( onPressed: () {
                    if(!_formKey.currentState!.validate()){
                      return;
                    }
                    _formKey.currentState!.save();
                    print(_name);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Showpage(Name:_name,Email:_email,Phone:_phone,Address:_address,DOB:_dob,Gender:_gender,Qualify:_Qualify,Desig:_jobtitl,Experience:_experience,Nationality:_nationality,LKnown:_lknown)));
                  }, child: const Text('Submit')),


                    ],
                  )))
          ),
        ),
    );
}
}
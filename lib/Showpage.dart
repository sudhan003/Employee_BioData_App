import 'package:flutter/material.dart';
import 'Confirmpage.dart';

class Showpage extends StatefulWidget {
  String Name;
  String Email;
  String Phone;
  String Address;
  String DOB;
  String Gender;
  String Qualify;
  String Desig;
  String Experience;
  String Nationality;
  String LKnown;

  Showpage(
      {required this.Name,
        required this.Email,
        required this.Phone,
        required this.Address,
        required this.DOB,
        required this.Gender,
        required this.Qualify,
        required this.Desig,
        required this.Experience,
        required this.Nationality,
        required this.LKnown
      });

  @override
  Widget build(BuildContext context) {
    TableRow _tablerow = TableRow(
        children: [
          Padding(padding: EdgeInsets.all(10),
            child: Text('', style: TextStyle(fontSize: 25)),
          ),
          Padding(padding: EdgeInsets.all(20),
            child: Text(''),)
        ]
    );

    TableRow _tablerow1 = TableRow(
        children: [
          Padding(padding: EdgeInsets.all(15),
            child: Text('Name', style: TextStyle(fontSize: 20)),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Text(Name, style: TextStyle(fontSize: 20)),
          )
        ]
    );

    TableRow _tablerow2 = TableRow(
        children: [
          Padding(padding: EdgeInsets.all(15),
            child: Text('Eamil', style: TextStyle(fontSize: 20)),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Text(Email, style: TextStyle(fontSize: 20)),
          )
        ]
    );
    TableRow _tablerow3 = TableRow(
        children: [
          Padding(padding: EdgeInsets.all(15),
            child: Text('Phone', style: TextStyle(fontSize: 20)),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Text(Phone, style: TextStyle(fontSize: 20)),
          )
        ]
    );
    TableRow _tablerow4 = TableRow(
        children: [
          Padding(padding: EdgeInsets.all(15),
            child: Text('Address', style: TextStyle(fontSize: 20)),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Text(Address, style: TextStyle(fontSize: 20)),
          )
        ]
    );
    TableRow _tablerow5 = TableRow(
        children: [
          Padding(padding: EdgeInsets.all(15),
            child: Text('DOB', style: TextStyle(fontSize: 20)),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Text(DOB, style: TextStyle(fontSize: 20)),
          )
        ]
    );
    TableRow _tablerow6 = TableRow(
        children: [
          Padding(padding: EdgeInsets.all(14),
            child: Text('Gender', style: TextStyle(fontSize: 20)),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Text(Gender, style: TextStyle(fontSize: 20)),
          )
        ]
    );
    TableRow _tablerow7 = TableRow(
        children: [
          Padding(padding: EdgeInsets.all(15),
            child: Text('Education', style: TextStyle(fontSize: 20)),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Text(Qualify, style: TextStyle(fontSize: 20)),
          )
        ]
    );
    TableRow _tablerow8= TableRow(
        children: [
          Padding(padding: EdgeInsets.all(15),
            child: Text('Job', style: TextStyle(fontSize: 20)),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Text(Desig, style: TextStyle(fontSize: 20)),
          )
        ]
    );
    TableRow _tablerow9 = TableRow(
        children: [
          Padding(padding: EdgeInsets.all(15),
            child: Text('Experience', style: TextStyle(fontSize: 20)),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Text(Experience, style: TextStyle(fontSize: 20)),
          )
        ]
    );
    TableRow _tablerow10 = TableRow(
        children: [
          Padding(padding: EdgeInsets.all(15),
            child: Text('Nationality', style: TextStyle(fontSize: 20)),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Text(Nationality, style: TextStyle(fontSize: 20)),
          )
        ]
    );
    TableRow _tablerow11 = TableRow(
        children: [
          Padding(padding: EdgeInsets.all(15),
            child: Text('Languages', style: TextStyle(fontSize: 20)),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Text(LKnown, style: TextStyle(fontSize: 20,)),
          )
        ]
    );
    return new Scaffold(
      backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text("Your Details"),
        ),
        body: Center(
            child: SingleChildScrollView(
              child: Table(
                defaultColumnWidth: const FixedColumnWidth(200),
                children: [
                  _tablerow,
                  _tablerow1,
                  _tablerow2,
                  _tablerow3,
                  _tablerow4,
                  _tablerow5,
                  _tablerow6,
                  _tablerow7,
                  _tablerow8,
                  _tablerow9,
                  _tablerow10,
                  _tablerow11,
                ],
              ),
            )
        )
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
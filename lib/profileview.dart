import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class profview extends StatefulWidget {
  String emailid;
  profview({required this.emailid, required docid});
  @override
  State<profview> createState() => _profviewState(emailid);
}

class _profviewState extends State<profview> {
  String emailid;
  _profviewState(this.emailid);

  final Stream<QuerySnapshot> _userprof =
      FirebaseFirestore.instance.collection('profile').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: StreamBuilder(
        stream: _userprof,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Text('Error on snap');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          return Container(
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => profview(
                                    docid: snapshot.data!.docs[index],
                                    emailid: emailid,
                                  )));
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: ListTile(
                            title: Text(
                              snapshot.data!.docChanges[index].doc['Name'],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          );
        },
        // Center(
        //   child: Column(
        //     children: [
        //       Container(
        //         // padding: EdgeInsets.only(top: 20),
        //         // child: CircleAvatar(
        //         //   radius: 85,
        //         //   backgroundColor: primaryColor,
        //         //   child: ClipOval(
        //         //     child: SizedBox(
        //         //       height: 160,
        //         //       width: 160,
        //         //       child: Image.network("https://images.unsplash.com/photo-1666289793297-aa8400bac103?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
        //         //       fit: BoxFit.cover,),
        //         //     ),
        //         //   ),
        //         // ),
        //
        //       )
        //     ],
        //   ),
      ),
    );
  }
}

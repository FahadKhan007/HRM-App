// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final ref = FirebaseDatabase.instance.ref('checkInInfo/');
  final ref2 = FirebaseDatabase.instance.ref('checkInDetails/CheckIn');
  // late String displayText;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: (() {
            Get.back();
          }),
          icon: Icon(Icons.keyboard_double_arrow_left),
          label: Text('Back'),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.deepPurple[900],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Expanded(
            //   child: FirebaseAnimatedList(
            //     query: ref,
            //     itemBuilder: (context, snapshot, animation, index) {
            //       return ListTile(
            //         title: Text(
            //           snapshot.child('time').value.toString(),
            //           style: GoogleFonts.ubuntu(
            //             fontSize: 20,
            //             color: Colors.white,
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(25),
                // height: 250,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent[400],
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white54,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            // textAlign: TextAlign.center,
                            "Check In Time",
                            style: GoogleFonts.ubuntu(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          Expanded(
                            child: FirebaseAnimatedList(
                              query: ref,
                              itemBuilder:
                                  (context, snapshot, animation, index) {
                                return ListTile(
                                  trailing: Text('test'),
                                  subtitle: Text(
                                    textAlign: TextAlign.center,
                                    snapshot.child('time').value.toString(),
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: Text(
                                    textAlign: TextAlign.center,
                                    snapshot.child('time').value.toString(),
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Check Out Time",
                            style: GoogleFonts.ubuntu(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          Expanded(
                            child: FirebaseAnimatedList(
                              // key: ref,
                              query: ref2,
                              itemBuilder:
                                  (context, snapshot, animation, index) {
                                return ListTile(
                                  title: Text(
                                    textAlign: TextAlign.center,
                                    snapshot.child('time').value.toString(),
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

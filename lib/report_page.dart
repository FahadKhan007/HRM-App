import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final ref = FirebaseDatabase.instance.ref('checkInInfo');
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
            Text(
              'Check In Time',
              style: GoogleFonts.ubuntu(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              'Check In Time',
              style: GoogleFonts.ubuntu(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Text(
                      snapshot.child('time').value.toString(),
                      style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

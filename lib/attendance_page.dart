// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'report_page.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  // ignore: deprecated_member_use
  late final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    DatabaseReference checkInInfo = database.child('checkInInfo/');
    DatabaseReference checkOutInfo = database.child('checkOutInfo/');
    DateTime time1 = DateTime.now();
    DateTime time2 = DateTime.now();

    DateTime dt1 = DateTime(2023, 1, 29, 17, 33, 50);
    DateTime dt2 = DateTime.now();

    final diff = (time2.difference(time1));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     'Current Time: ${DateFormat('yMMMMd').format(time)}',
            //     style: GoogleFonts.ubuntu(
            //       fontSize: 20,
            //       color: Colors.black87,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     'Current Time: ${DateFormat('jms').format(time)}',
            //     style: GoogleFonts.ubuntu(
            //       fontSize: 20,
            //       color: Colors.black26,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () async {
                      Get.to(() => ReportPage());
                      // Get.to(() => ReportPage(), arguments: {
                      //   "date":
                      //       "Current Date: ${DateFormat('yMMMMd').format(time)}",
                      //   "time":
                      //       "Current Time: ${DateFormat('jms').format(time)}",
                      // });
                      // setState(() {});
                      try {
                        await checkInInfo.set({
                          "time": "Check in time: " +
                              DateFormat('jms').format(time1),
                        });
                      } catch (e) {
                        print('You got an error !! $e');
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(2, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Check In",
                          style: GoogleFonts.ubuntu(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 90),
                Container(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () async {
                      // Get.to(() => ReportPage(), arguments: {
                      //   "date":
                      //       "Current Date: ${DateFormat('yMMMMd').format(time)}",
                      //   "time":
                      //       "Current Time: ${DateFormat('jms').format(time)}",
                      // });
                      setState(() {});
                      try {
                        await checkOutInfo.update({
                          "date":
                              "Current Date: ${DateFormat('yMMMMd').format(DateTime.now())}",
                          "time": "${DateFormat('jms').format(time2)}",
                          "hour":
                              "Difference in hours: " + diff.inHours.toString(),
                          "minute": "Difference in minutes: " +
                              (diff.inMinutes % 60).toString(),
                          "second": "Difference in seconds: " +
                              ((diff.inSeconds % 3600) % 60).toString(),
                        });
                      } catch (e) {
                        print('You got an error !! $e');
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(2, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Check Out",
                          style: GoogleFonts.ubuntu(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

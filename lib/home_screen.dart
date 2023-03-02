// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:human_resource_management/auth_controller.dart';
import 'package:human_resource_management/report_screen.dart';
import 'package:intl/intl.dart';

import 'attendance_screen.dart';
import 'attendance_screen_two.dart';
import 'my_drawer.dart';

class HomePage extends StatelessWidget {
  String email;

  HomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("DashBoard"),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text("Log Out"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                  //topRight: Radius.elliptical(10, 10),
                ),
              ),
            ),

            onPressed: (() {
              AuthController.instance.logOut();
            }),
            // IconButton(
            //   icon: Icon(Icons.logout_rounded),
            //   onPressed: () {
            //     AuthController.instance.logOut();
            //   },
          ),
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: Colors.white24,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              //margin: EdgeInsets.only(top: 12),
              child: Text(
                'Welcome',
                style: GoogleFonts.ubuntu(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                email,
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 12),
              child: Text(
                'Checking In/Out Details',
                style: GoogleFonts.ubuntu(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[400],
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
                        Text(
                          "Check In Time",
                          style: GoogleFonts.ubuntu(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "09:30 am",
                          style: GoogleFonts.ubuntu(
                            fontSize: 15,
                            color: Colors.white,
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
                        Text(
                          "Check Out Time",
                          style: GoogleFonts.ubuntu(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "03:30 pm",
                          style: GoogleFonts.ubuntu(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 24),
            //   child: Builder(
            //     builder: (context) {
            //       // ignore: unused_local_variable
            //       final GlobalKey<SlideActionState> key = GlobalKey();
            //       return SlideAction(
            //         text: "Slide to Check In",
            //         textStyle: GoogleFonts.ubuntu(
            //           fontSize: 20,
            //           color: Colors.black,
            //         ),
            //         outerColor: Colors.grey[300],
            //         innerColor: Colors.deepPurple,
            //       );
            //     },
            //   ),
            // ),
            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => AttendanceScreen());
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
                            "Attendance",
                            style: GoogleFonts.ubuntu(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.to(AttendanceScreenTwo());
                        Get.to(My2App());
                      },
                      child: Container(
                        height: 60,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[900],
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
                            "Test Button",
                            style: GoogleFonts.ubuntu(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => ReportScreen(),
                          arguments: {
                            "date":
                                "Current Date: ${DateFormat('yMMMMd').format(time)}",
                            "time":
                                "Current Time: ${DateFormat('jms').format(time)}",
                          },
                        );
                      },
                      child: Container(
                        height: 60,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[900],
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
                            "Report",
                            style: GoogleFonts.ubuntu(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {},
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
                            "Test Button",
                            style: GoogleFonts.ubuntu(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //   child: GestureDetector(
            //     onTap: () {
            //       AuthController.instance.logOut();
            //     },
            //     child: Container(
            //       padding: EdgeInsets.all(20.0),
            //       decoration: BoxDecoration(
            //         color: Colors.deepPurple,
            //         border: Border.all(color: Colors.black),
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       child: Center(
            //         child: Text(
            //           'Sign Out',
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 18,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Widget MyDrawerList() {
  //   return Container(
  //     padding: EdgeInsets.only(top: 15),
  //     child: Column(children: [
  //       menuItem(),
  //     ]),
  //   );
  // }

  // Widget menuItem() {
  //   return Material(
  //     child: InkWell(
  //       onTap: (() {}),
  //       child: Padding(
  //         padding: EdgeInsets.all(15.0),
  //         child: Row(
  //           // ignore: prefer_const_literals_to_create_immutables
  //           children: [
  //             Expanded(
  //               child: Icon(
  //                 Icons.dashboard_customize_outlined,
  //                 size: 20,
  //                 color: Colors.black,
  //               ),
  //             ),
  //             Expanded(
  //               flex: 3,
  //               child: Text(
  //                 "Dashboard",
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 16,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

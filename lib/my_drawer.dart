// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'attendance_screen.dart';
import 'auth_controller.dart';
import 'home_screen.dart';
import 'report_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.deepPurple,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://media.tenor.com/c_YU3p6py2AAAAAd/meme-crying.gif',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'Welcome',
                    style: GoogleFonts.ubuntu(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'user@email.com',
                    style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Get.back();
            },
            leading: Icon(Icons.dashboard_customize_outlined),
            title: Text(
              'Dashboard',
              style: GoogleFonts.ubuntu(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(
                () => AttendanceScreen(),
              );
            },
            leading: Icon(Icons.calendar_month),
            title: Text(
              'Attendence',
              style: GoogleFonts.ubuntu(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(
                () => ReportScreen(),
              );
            },
            leading: Icon(Icons.data_exploration),
            title: Text(
              'Report',
              style: GoogleFonts.ubuntu(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              AuthController.instance.logOut();
            },
            leading: Icon(Icons.logout_outlined),
            title: Text(
              'Log Out',
              style: GoogleFonts.ubuntu(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

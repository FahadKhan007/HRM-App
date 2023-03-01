// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:slide_to_act/slide_to_act.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AttendanceScreenTwo extends StatefulWidget {
//   const AttendanceScreenTwo({super.key});

//   @override
//   State<AttendanceScreenTwo> createState() => _AttendenceScreen2State();
// }

// class _AttendenceScreen2State extends State<AttendanceScreenTwo> {
//   @override
//   Widget build(BuildContext context) {
//     bool check = false;
//     final databaseRef = FirebaseDatabase.instance.ref('checkInDetails/CheckIn');
//     final databaseRef2 =
//         FirebaseDatabase.instance.ref('checkInDetails/CheckOut');

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.only(top: 12),
//               child: Text(
//                 'Today\'s Status',
//                 style: GoogleFonts.ubuntu(
//                   fontSize: 30,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 12),
//               height: 150,
//               decoration: BoxDecoration(
//                 color: Colors.deepPurpleAccent[400],
//                 // ignore: prefer_const_literals_to_create_immutables
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 10,
//                     offset: Offset(2, 2),
//                   ),
//                 ],
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children: [
//                         Text(
//                           "Check In",
//                           style: GoogleFonts.ubuntu(
//                             fontSize: 18,
//                             color: Colors.white70,
//                           ),
//                         ),
//                         Text(
//                           "--/--",
//                           style: GoogleFonts.ubuntu(
//                             fontSize: 15,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children: [
//                         Text(
//                           "Check Out",
//                           style: GoogleFonts.ubuntu(
//                             fontSize: 18,
//                             color: Colors.white70,
//                           ),
//                         ),
//                         Text(
//                           "--/--",
//                           style: GoogleFonts.ubuntu(
//                             fontSize: 15,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 DateFormat('yMMMMd').format(DateTime.now()),
//                 style: GoogleFonts.ubuntu(
//                   fontSize: 28,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             StreamBuilder(
//                 stream: Stream.periodic(
//                   const Duration(seconds: 1),
//                 ),
//                 builder: (context, snapshot) {
//                   return Container(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       DateFormat('jms').format(DateTime.now()),
//                       style: GoogleFonts.ubuntu(
//                         fontSize: 28,
//                         color: Colors.black,
//                       ),
//                     ),
//                   );
//                 }),
//             Container(
//               margin: EdgeInsets.only(top: 20),
//               child: Builder(
//                 builder: (context) {
//                   final GlobalKey<SlideActionState> key = GlobalKey();

//                   return SlideAction(
//                     text: "Slide to Check In",
//                     textStyle: GoogleFonts.ubuntu(
//                       fontSize: 20,
//                       color: Colors.black,
//                     ),
//                     outerColor: Colors.white,
//                     innerColor: Colors.deepPurple,
//                     key: key,
//                     onSubmit: () async {
//                       // databaseRef
//                       //     .child(
//                       //         DateTime.now().millisecondsSinceEpoch.toString())
//                       //     .set({
//                       //   'time': DateFormat('jms').format(DateTime.now()),
//                       // }).then((value) {
//                       //   print("successful");
//                       //   setState(() {
//                       //     check = false;
//                       //   });
//                       // }).onError((error, stackTrace) {
//                       //   setState(() {
//                       //     check = false;
//                       //   });
//                       //   print('Error');
//                       // });
//                       // databaseRef2
//                       //     .child(
//                       //         DateTime.now().millisecondsSinceEpoch.toString())
//                       //     .set({
//                       //   'time': DateFormat('jms').format(DateTime.now()),
//                       // }).then((value) {
//                       //   print("successful");
//                       //   setState(() {
//                       //     check = false;
//                       //   });
//                       // }).onError((error, stackTrace) {
//                       //   setState(() {
//                       //     check = false;
//                       //   });
//                       //   print('Error');
//                       // });
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

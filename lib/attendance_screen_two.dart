import 'dart:math';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:once/once.dart';

class My2App extends StatefulWidget {
  const My2App({Key? key}) : super(key: key);

  @override
  State<My2App> createState() => _My2AppState();
}

class _My2AppState extends State<My2App> {
  var isVisible = false;

  String currentValue = 'Hello World';

  @override
  void initState() {
    Once.runOnce(
      'my-app-widget',
      callback: () => set('Once Started'),
    );
    Once.runOnEveryNewVersion(
      callback: () {
        /* What's new in 2.3.2 version? dialog */
      },
      fallback: () {
        /* Navigate to new screen */
      },
    );
    super.initState();
  }

  void set(String newOnce) {
    setState(
      () {
        currentValue = newOnce + ' ${Random().nextInt(100)}';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Once Made with ❤️'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(
                    () => isVisible = !isVisible,
                  ),
                  child: Text("S / H"),
                ),
                if (isVisible)
                  Image(
                    image: NetworkImage(
                        "https://media.tenor.com/c_YU3p6py2AAAAAd/meme-crying.gif"),
                  ),

                //   ElevatedButton(
                //     child: const Text("Run Evert 5 Sec"),
                //     onPressed: () {
                //       Once.runCustom(
                //         "x",
                //         duration: const Duration(seconds: 5),
                //         callback: () => set("Hello Custom"),
                //       );
                //     },
                //   ),
                OnceWidget.showOnEveryNewVersion(
                  builder: () {
                    return const Text('Hey, It new app version, Smile!');
                  },
                  fallback: () {
                    return const Text('Welcome back');
                  },
                ),
                OnceWidget.showOnce(
                  'onceWidget',
                  builder: () {
                    return const Text('Hey, I am the once widget');
                  },
                  fallback: () {
                    return const Text('I am not the one widget');
                  },
                ),
                OnceWidget.showEvery12Hours(
                  'widgetEvery12Hours',
                  builder: () {
                    return Text('Hey, I am the every12Hours widget');
                  },
                ),

                ElevatedButton(
                  child: const Text("Run On New Version"),
                  onPressed: () {
                    Once.runOnEveryNewVersion(
                      callback: () => set("Hello New Version"),
                      fallback: () => set('Okay its not new version'),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text("Run Hourly"),
                  onPressed: () {
                    Once.runHourly(
                      "Hourly",
                      callback: () => set("Hello Hourly"),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text("Run Every 12 Hour"),
                  onPressed: () {
                    Once.runEvery12Hours(
                      "12 Hour",
                      callback: () => set("Hello 12 Hour"),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text("Run Daily"),
                  onPressed: () {
                    Once.runDaily(
                      "Daily",
                      callback: () => set("Hello Daily"),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text("Run On New Month"),
                  onPressed: () {
                    Once.runOnNewMonth(
                      "New Month",
                      callback: () => set("Hello New Month"),
                      fallback: () => set("Hello New Month Fallback"),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text("Run Monthly"),
                  onPressed: () {
                    Once.runMonthly("Monthly x",
                        callback: () => set("Hello Monthly"),
                        fallback: () => set('Hello Monthly Fallback'));
                  },
                ),
                ElevatedButton(
                  child: const Text("Run Monthly Debug"),
                  onPressed: () {
                    Once.runMonthly(
                      "Monthly debug",
                      callback: () => set("Hello Monthly"),
                      fallback: () => set('Hello Monthly Fallback'),
                      debugCallback: true,
                    );
                  },
                ),
                // ElevatedButton(
                //   child: const Text("Run Evert 5 Sec"),
                //   onPressed: () {
                //     Once.runCustom(
                //       "x",
                //       duration: const Duration(seconds: 5),
                //       callback: () => set("Hello Custom"),
                //     );
                //   },
                // ),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  currentValue,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

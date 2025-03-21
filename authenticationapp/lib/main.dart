
// import 'package:authenticationapp/pages/first_page.dart';
// import 'package:authenticationapp/pages/second_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FirstPage(),
//       routes: {
//         '/secondpage': (context) => SecondPage(),
//       },
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple[200],
        appBar: AppBar(
          title: Text("My App Bar"),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              // curve the corners a bit
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(25),
            // child: Icon(
            //   Icons.ac_unit_rounded,
            //   color: Colors.white,
            //   size: 64,

            // ),
            child: Text(
              "Subha BK",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),  
            ),
            

          ),
         
        ),
      ),
    );
  }
}

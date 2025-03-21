import 'package:flutter/material.dart';

class Infopage extends StatefulWidget {
  const Infopage({super.key});

  @override
  State<Infopage> createState() => _InfopageState();
}

class _InfopageState extends State<Infopage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange[200],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'YOUR PERSONAL INFORMATIONS',
                style: TextStyle(
                  color: Colors.brown[900],
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
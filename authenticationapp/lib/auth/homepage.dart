import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Homepage"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Hello Guyssss")
          ],
        ),
      ),
    );
  }
}
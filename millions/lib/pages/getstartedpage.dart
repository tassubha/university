import 'package:flutter/material.dart';
import 'package:millions/pages/infoPage.dart';

class Getstartedpage extends StatefulWidget {
  const Getstartedpage({super.key});

  @override
  State<Getstartedpage> createState() => _GetstartedpageState();
}

class _GetstartedpageState extends State<Getstartedpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange[200],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CONGRATS! your account has been created',
                  style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'now its time to personalize your account',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 60, 49, 45)
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Infopage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18),
                ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
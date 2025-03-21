import 'package:authenticationapp/pages/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("1st page")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to second page"),
          onPressed: () {
            //navigate to second page
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SecondPage(),
            //   ),
            // );
            Navigator.pushNamed(context, '/secondpage');
          },
        ),
      ),
    );
  }
}
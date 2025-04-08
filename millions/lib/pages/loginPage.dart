
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:millions/components/button.dart';
import 'package:millions/components/textfield.dart';
import 'package:millions/pages/getstartedpage.dart';
import 'package:millions/pages/homepage.dart';
import "package:millions/services/firestore.dart";
import 'package:millions/services/auth_service.dart';

class LogInPage extends StatelessWidget {
  //text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LogInPage ({super.key});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],

      appBar: AppBar(
          title: Text(
            "m i l l i o n s",
            style: TextStyle(
              color: Colors.orangeAccent,
              fontFamily: 'Charm',
            ),
          ),
          centerTitle: true,
          backgroundColor:  Colors.brown[800],          
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // logo
          Icon(
            Icons.person,
            size: 80,
            color: Colors.brown[900],
          ),

          const SizedBox(height: 15),

          // app name
          Text(
            "L O G I N", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.brown[900],
              ),
          ),

          const SizedBox(height: 50) ,

          // email textfield
          MyTextField(
            hintText: "Email",
            style: TextStyle(
              color: Colors.brown[900],
            ),
            obscureText: false,
            controller: emailController,
          ),

          const SizedBox(height: 10) ,
          // password textfield
          MyTextField(
            hintText: "Password",
            style: TextStyle(
              color: Colors.brown[900],
            ),
            obscureText: true,
            controller: passwordController,
          ),
         
          const SizedBox(height: 20) ,
          // next button
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () async {
                final email = emailController.text.trim();
                final password = passwordController.text;

                if (email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                  return;
                }

                final error = await _authService.login(email, password);

                if (error != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error)),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }

                              
                              
              },
              backgroundColor: Colors.brown[800],
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.orangeAccent,
              ),
              ),
          )
            ],
          ),
        ),        
      ),     
    );
  }
}
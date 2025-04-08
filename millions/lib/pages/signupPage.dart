import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:millions/components/button.dart';
import 'package:millions/components/textfield.dart';
import 'package:millions/pages/getstartedpage.dart';
//import 'package:millions/services/auth.dart';
import "package:millions/services/firestore.dart";
import 'package:millions/services/auth_service.dart';

class SignUpPage extends StatelessWidget {
  //text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  SignUpPage ({super.key});

  //AuthService authservice =  AuthService();
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
            "S I G N U P", style: TextStyle(
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

          // username
          MyTextField(
            hintText: "Username",
            style: TextStyle(
              color: Colors.brown[900],
            ),
            obscureText: false,
            controller: usernameController,
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

          const SizedBox(height: 10) ,

          // confirm password textfield
          MyTextField(
            hintText: "Confirm Password",
            style: TextStyle(
              color: Colors.brown[900],
            ),
            obscureText: true,
            controller: confirmPasswordController,
          ),

          
          const SizedBox(height: 20) ,

          // next button
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () async {
                // validate inputs
                final email = emailController.text;
                final username = usernameController.text;
                final password = passwordController.text;
                final confirmPassword = confirmPasswordController.text;
              

                if (email.substring(email.length - 9, email.length) != "gmail.com") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please provide a valid google account')),
                  );
                  return;
                }

                if (email.isEmpty || username.isEmpty || password.isEmpty || confirmPassword.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                  return;
                }
                if (password != confirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password do not match')),
                  );
                  return;
                }

                final error = await _authService.signUp(username, email, password);

                if(error != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error)),
                  );
                } else {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Getstartedpage()),
                );

                }

                //firestoreDatabaseAddUser(username, email, password);
                //authservice.signup(username, email, password);

                // navigate to GetStartedPage
                
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
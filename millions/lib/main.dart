import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:millions/pages/homepage.dart';
import 'package:millions/pages/infoPage.dart';
import 'package:millions/pages/loginPage.dart';
import 'package:millions/pages/signuppage.dart';
import 'package:millions/theme/dark_mode.dart';
import 'package:millions/theme/light_mode.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Builder(
      builder: (context) => Scaffold(
      backgroundColor: Colors.orange[200],

      appBar: AppBar(
          title: Text(
            "m i l l i o n s",
            style: TextStyle(
              color: Colors.orangeAccent[200],
              fontFamily: 'Charm',
            ),
          ),
          centerTitle: true,
          backgroundColor:  Colors.brown[800],          
      ),

      body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Text(
          'Welcome to the World of Productivity',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
          ),
        ),


         const SizedBox(height: 16),


         Text(
          'spend your money wisely with MILLLIONS from today',
          style: TextStyle(
            fontSize: 16,
            color: Colors.brown[800],
          ),
         ),


         const SizedBox(height: 32),


         ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
         }, 
         style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown[800],
          foregroundColor: Colors.orangeAccent[200],
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),

         ),
         child: const Text('Sign Up'),
        ),


        const SizedBox(height: 16),


        ElevatedButton(
          onPressed:() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogInPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown[800],
            foregroundColor: Colors.orangeAccent[200],
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          ),
          child: const Text('Log In'),
        ),

          
        ],
          ),
        ),     
      ),
      
      ),
    );  
  }
}



import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
      theme: ThemeData(),
      darkTheme: darkMode,
      home: Builder(
      builder: (context) => Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.surface,
      backgroundColor: Colors.orange[200],
      body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Text(
          'Welcome To The World Of Productivity',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
         const SizedBox(height: 16),
         Text(
          'spend your money wisely with MILLLIONS from today',
          style: TextStyle(
            fontSize: 16,
            color: const Color.fromARGB(255, 60, 49, 45)
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
          backgroundColor: Colors.brown,
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
            backgroundColor: Colors.brown,
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



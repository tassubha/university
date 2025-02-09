import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() =>  _LogInState();
}

class  _LogInState extends State <LogIn> {
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, 
      title: Text("log in"),
      centerTitle:true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value){
                  email = value;

                },
                decoration: InputDecoration(
                  hintText: "example@gmail.com",
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value){
                  password = value;

                },
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "give pass that you remember easily",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){},
             child: Text("log in")),
             SizedBox(
              height: 20,
            ), 
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                Text("not have an account   "),
              InkWell(
                onTap: (){},
                child: Text("SignUp",style: TextStyle(color: Colors.green),)
                ),
              
              ],
              
              ),
            )

          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:millions/components/textfield.dart';
import 'package:millions/pages/homepage.dart';

class Infopage extends StatefulWidget {
  const Infopage({super.key});
  @override
  State<Infopage> createState() => _InfopageState();
}

// int percentageToMoney(TextEditingController input, double percentage) {
//   if (input.text.isEmpty == true) {
//     // no money provided
//     return -1;
//   }

//   if (!(int.tryParse(input.text) ?? )) {

//   }
// }

class _InfopageState extends State<Infopage> {
  final TextEditingController incomeInput = TextEditingController();
  double fundementalPercentage = 60.0;
  double funPercentage = 30.0;
  double futurePercentage = 10.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange[200],

        appBar: AppBar(
          title: Text(
            "Millions",
            style: TextStyle(
              color: Colors.orangeAccent,
              fontFamily: 'Charm',
            ),
          ),
          backgroundColor:  Colors.brown[800],          
        ),

        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Provide Personal Details",
                  style: TextStyle(
                    fontFamily: "OutfitLight",
                    fontSize: 32.0,
                  ),
                )
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: 25.0,
                  right: 25.0
                ),

                child: MyTextField(
                  hintText: "Enter Your Salary",
                  controller: incomeInput,
                  obscureText: false,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: 28.0,
                  bottom: 12.0
                ),

                child: Text(
                  "Configure Spending Areas",
                  style: TextStyle(
                    fontFamily: "OutfitLight",
                    fontSize: 24.0,
                  ),
                )
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: 0.0,
                  right: 25.0 * 9
                ),

                child: Slider(
                  max: 100,
                  divisions: 20,
                  value: fundementalPercentage,
                  label: "Fundemental  ${fundementalPercentage.round().toString()} %",
                  onChanged: (double value) {
                    setState(() {
                      fundementalPercentage = value;
                      funPercentage = 100 - (fundementalPercentage + futurePercentage);
                    });
                  },
                )
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: 0.0,
                  right: 25.0 * 9
                ),

                child: Slider(
                  max: 100,
                  divisions: 20,
                  value: funPercentage,
                  label: "Fundemental  ${funPercentage.round().toString()} %",
                  onChanged: (double value) {
                    setState(() {
                      funPercentage = value;
                      futurePercentage = 100 - (fundementalPercentage + funPercentage);
                    });
                  },
                )
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: 0.0,
                  right: 25.0 * 9
                ),

                child: Slider(
                  max: 100,
                  divisions: 20,
                  value: futurePercentage,
                  label: "Fundemental  ${futurePercentage.round().toString()} %",
                  onChanged: (double value) {
                    setState(() {
                      futurePercentage = value;
                      fundementalPercentage = 100 - (futurePercentage + funPercentage);
                    });
                  },
                )
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 18),
                ),
                ),

            ] // Children
          ),
      )

    );
  }
}
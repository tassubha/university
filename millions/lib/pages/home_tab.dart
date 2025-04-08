// home_tab.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  double salary = 0;
  double totalExpense = 0;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    // Get salary
    final userDoc = await _firestore.collection('users').doc(uid).get();
    salary = (userDoc.data()?['salary'] ?? 0).toDouble();

    // Get expenses
    final expenseSnap = await _firestore.collection('users').doc(uid).collection('expenses').get();
    totalExpense = expenseSnap.docs.fold(0, (sum, doc) => sum + (doc.data()['amount'] ?? 0).toDouble());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double moneyLeft = salary - totalExpense;

    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Monthly Salary: \$${salary.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 24, color: Colors.brown[900]),
            ),
            const SizedBox(height: 12),
            Text("Money Left After Expenses: \$${moneyLeft.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, color: Colors.green[800]),
            ),
            const SizedBox(height: 20),
            Text("Total Spent: \$${totalExpense.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 18, color: Colors.red[800]),
            ),
          ],
        ),
      ),
    );
  }
}



















// import 'package:flutter/material.dart';
// import 'package:millions/pages/infoPage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   final newExpenseNameController = TextEditingController();
//   final newExpenseAmountController = TextEditingController();

//   int moneyLeft = int.parse(incomeInput.text);

//   // add new expense
//   void addNewExpense() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Add new expense'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(controller: newExpenseNameController,),
//             TextField(controller: newExpenseAmountController,),
//             Text(
//               'your current amount: $moneyLeft'
              
//             )
//           ],
//         ),
//         actions: [
//           // save button
//           MaterialButton(
//             onPressed: save,
//             child: Text('Save'),
//           ),


//           // cancel button
//           MaterialButton(
//             onPressed: cancel,
//             child: Text('Cancel'),
//           ),
//         ],
//       ),
//     );
//   }

//   //save
//   void save() async {
//     moneyLeft -= int.parse(newExpenseAmountController.text);
//     print(moneyLeft);
//     final String name = newExpenseNameController.text;
//   final int amount = int.parse(newExpenseAmountController.text);

//   // Save to Firestore
//   await FirebaseFirestore.instance.collection('expenses').add({
//     'name': name,
//     'amount': amount,
//     'timestamp': Timestamp.now(),
//   });

//   setState(() {
//     moneyLeft -= amount;
//   });

//   newExpenseNameController.clear();
//   newExpenseAmountController.clear();
//   Navigator.pop(context);
//   }

//   //cancel
//   void cancel(){

//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orangeAccent,
      
//       floatingActionButton: FloatingActionButton(
//         onPressed: addNewExpense,
//         child: Icon(Icons.add),
//         ),

//     );
//   }
// }
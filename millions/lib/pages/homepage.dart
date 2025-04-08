import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:millions/pages/infoPage.dart'; // for `incomeInput`

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  int initialSalary = int.tryParse(incomeInput.text) ?? 0;

  // add new expense
  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.brown[800],
        title: const Text(
          'Add New Expense',
          style: TextStyle(color: Colors.orangeAccent),
          
          ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [


            TextField(
              controller: newExpenseNameController,
              decoration: const InputDecoration(
                  labelText: 'Expense Name',
                  labelStyle: TextStyle(color: Colors.orangeAccent),
                  enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                ),
              ),
              style: const TextStyle(color: Colors.orangeAccent),
            ),


            TextField(
              controller: newExpenseAmountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(color: Colors.orangeAccent),
                enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.orangeAccent),
                ),
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.orangeAccent),
            ),
          ],
        ),
        actions: [

          TextButton(
            onPressed: save,
            child: const Text('Save'),
            style: TextButton.styleFrom(foregroundColor: Colors.orangeAccent),
          ),


          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
            style: TextButton.styleFrom(foregroundColor: Colors.orangeAccent),
          ),
        ],
      ),
    );
  }

  // Save new expense to Firestore
  void save() async {
    final String name = newExpenseNameController.text;
    final int? amount = int.tryParse(newExpenseAmountController.text);

    if (name.isEmpty || amount == null) return;

    await FirebaseFirestore.instance.collection('expenses').add({
      'name': name,
      'amount': amount,
      'timestamp': Timestamp.now(),
    });

    newExpenseNameController.clear();
    newExpenseAmountController.clear();
    Navigator.pop(context);
  }

  // Calculate money left after expenses
  int calculateMoneyLeft(AsyncSnapshot<QuerySnapshot> snapshot) {
    int totalSpent = 0;
    for (var doc in snapshot.data!.docs) {
      totalSpent += (doc['amount'] as int);
    }
    return initialSalary - totalSpent;
  }

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


      floatingActionButton: FloatingActionButton(
        onPressed: addNewExpense,
        backgroundColor: Colors.brown[800],
        foregroundColor: Colors.orangeAccent,
        child: const Icon(Icons.add),
      ),


      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('expenses')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          int moneyLeft = calculateMoneyLeft(snapshot);
          final expenses = snapshot.data!.docs;

          return Column(
            children: [
              const SizedBox(height: 16),
              Text(
                "Money Left: ৳ $moneyLeft",
                style: const TextStyle(
                  color: Color.fromARGB(255, 43, 32, 29),
                  fontSize: 22,
                  fontFamily: 'OutfitLight',
                  fontWeight: FontWeight.bold,
                ),
              ),


              const SizedBox(height: 16),


              Expanded(
                child: ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    final doc = expenses[index];
                    return ListTile(
                      title: Text(doc['name']),
                      trailing: Text("৳ ${doc['amount']}"),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

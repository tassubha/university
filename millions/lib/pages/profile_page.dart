import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  void loadProfileData() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final userDoc = await _firestore.collection('users').doc(uid).get();
    setState(() {
      usernameController.text = userDoc['username'] ?? '';
      salaryController.text = userDoc['salary'].toString();
    });
  }

  void saveProfileData() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final username = usernameController.text.trim();
    final salary = double.tryParse(salaryController.text.trim());

    if (username.isEmpty || salary == null || salary <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid data")),
      );
      return;
    }

    await _firestore.collection('users').doc(uid).update({
      'username': username,
      'salary': salary,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile updated")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.brown[800],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: salaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Monthly Salary"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: saveProfileData,
              child: const Text("Save Profile"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.orangeAccent[200],
              ),
            )
          ],
        ),
      ),
    );
  }
}

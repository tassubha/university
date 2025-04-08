import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> signup(String username, String email, String password) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email, password: password);
    await firestore.collection('users').doc(userCredential.user!.uid).set({
      'username': username,
      'email': email,
      'password': password,
    });
  }
}
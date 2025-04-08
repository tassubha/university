import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

final CollectionReference firestoreDatabaseUserData = 
  FirebaseFirestore.instance.collection("user_data");

Future<void> firestoreDatabaseAddUser(String username, String email, String password) {
  return firestoreDatabaseUserData.add({
    "username": username,
    "email": email,
    "password": password,
  });
}

// class AuthService {
//   final FirebaseAuth auth = FirebaseFirestore.instance;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Future<void> firestoreDatabaseAddUser(String username, String email, String password) async {
//     UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password)
//   }
// }
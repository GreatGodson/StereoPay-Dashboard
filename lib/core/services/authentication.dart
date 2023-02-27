import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:streopay_dashboard/pages/drivers/drivers.dart';

String? uid;

class AuthenticationService {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;
  String? exception;
  User? _loggedInUser;

  Future registerUser(
      {required email,
      required password,
      required firstName,
      required BuildContext context}) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (newUser.user != null) {
        uid = newUser.user?.uid;
        _store.collection("users").doc(uid).set({
          'uid': uid,
          'name': firstName,
          'email': email,
          'password': password,
          'tickets': [],
        });
        // sendVerificationMail();

        return uid;
      }
      print('complete');
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      debugPrint(e.toString());
      print('error');
      exception = e.message;
    }
  }

  Future createTicket({required List ticketData}) async {
    String uid = _auth.currentUser!.uid;
    // var y =
    //     await _store.collection("users").doc(uid).collection("tickets").get();
    // print(y);

    try {
      _store.collection("users").doc(uid).update({
        'tickets': ticketData,
      });
    } catch (e) {
      debugPrint('this is the error $e');
    }
  }

  Future<String?> getCurrentUserEmail() async {
    User? user = _auth.currentUser;
    try {
      if (user != null) {
        _loggedInUser = user;
      }
    } on FirebaseAuthException catch (e) {
      throw e.message.toString();
    }
    return _loggedInUser?.email;
  }

  void sendVerificationMail() {
    User? user = _auth.currentUser;
    user?.sendEmailVerification();
  }

  Future<bool> checkIfMailVerified() async {
    bool? isEmailVerified;
    User? user = _auth.currentUser;
    await user?.reload();
    isEmailVerified = user?.emailVerified;
    print(isEmailVerified);
    return isEmailVerified!;
  }

  Future logInUser(
      {required email,
      required password,
      required BuildContext context}) async {
    bool? loggedIn;
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      uid = user.user!.uid;
      loggedIn = true;
      return user.user;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      debugPrint("this is the error: $e");
      loggedIn = false;
      exception = e.message;
    }
    return loggedIn;
  }

  Future<void> logOutUser() async {
    await _auth.signOut();
  }

// getUserDollarBalance() async {
//   User? user = auth.currentUser;
//   final userUid = user!.uid;
//   final data = await collection.doc(userUid).get();
//   int dollarBalance = data["usdBalance"];
//   return dollarBalance;
// }
}

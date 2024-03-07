import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBfFimTe8s4YPtoiKoMV7e_3h5ZD4tb6Y8",
            authDomain: "sampletodo2.firebaseapp.com",
            projectId: "sampletodo2",
            storageBucket: "sampletodo2.appspot.com",
            messagingSenderId: "521756896134",
            appId: "1:521756896134:web:01aed7b05e8164e7911a07",
            measurementId: "G-LN8BSQKEGM"));
  } else {
    await Firebase.initializeApp();
  }
}

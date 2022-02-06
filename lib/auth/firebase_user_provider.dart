import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Test4FirebaseUser {
  Test4FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

Test4FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Test4FirebaseUser> test4FirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<Test4FirebaseUser>((user) => currentUser = Test4FirebaseUser(user));

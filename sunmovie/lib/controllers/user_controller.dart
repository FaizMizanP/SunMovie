import 'package:sunmovie/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _currentUser;

  AppUser? get currentUser => _currentUser;

  // Mendapatkan status login pengguna saat ini
  Stream<AppUser?> get authStateChanges =>
      _auth.authStateChanges().map((user) => _userFromFirebaseUser(user));

  // Konversi objek User Firebase menjadi objek AppUser aplikasi
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid, email: user.email!) : null;
  }

  // Registrasi pengguna baru
  Future<String?> registerUser(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user?.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Masuk dengan email dan password
  Future<String?> loginUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user?.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Keluar dari akun pengguna
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

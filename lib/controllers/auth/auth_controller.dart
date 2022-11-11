import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_app/firebase_ref/firebase_references.dart';
import 'package:study_app/screens/login/login_screen.dart';
import 'package:study_app/widgets/dialogs/dialogue_widget.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen(
      (User? user) {
        _user.value = user;
      },
    );
    navigateToIntroduction();
  }

  signInwithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);

        await _auth.signInWithCredential(_credential);
        await saveUser(account);
      }
    } on Exception catch (error) {
      print(error);
    }
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilePic": account.photoUrl
    });
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }

  void showLoginAlertDialog() {
    Get.dialog(
      Dialogs.questionStartDialog(onTap: () {
        Get.back();
        navigateTLoginPage();
      }),
      barrierDismissible: false,
    );
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  void navigateTLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }
}

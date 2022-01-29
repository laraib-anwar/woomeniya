import 'firebase_auth_service.dart';
import 'local_storage.dart';
class LogoutService {
  LocalStorageService _localStorage = LocalStorageService();
  FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  Future<void> logout() async{
    _firebaseAuthService.logOut();
    await _localStorage.setAuthToken(accessToken: null, refreshToken: null);
  }
}
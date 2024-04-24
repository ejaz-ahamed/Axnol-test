import 'package:axnol_project/controller/services/login_services.dart';
import 'package:axnol_project/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@Riverpod(keepAlive: true)
class Login extends _$Login {
  @override
  User? build() {
    return null;
  }

  Future<void> login(String email, String password) async {
    final userData = await ApiServices.login(email, password);

    state = User(
        firstName: userData['fname'] ?? '',
        lastName: userData['lname'] ?? '',
        address: userData['address'] ?? '',
        email: userData['email'] ?? '',
        mobile: userData['mobile'] ?? '',
        details: userData['detail'] ?? '');
  }
}

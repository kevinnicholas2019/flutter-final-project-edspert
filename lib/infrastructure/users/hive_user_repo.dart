import 'package:final_project_edspert/domain/users/i_user_repository.dart';
import 'package:final_project_edspert/domain/users/user.dart' as domain;
import 'package:hive/hive.dart';

class HiveUserRepo implements IUserRepository {
  @override
  Future<void> saveFirebaseCredential(
      String? accessToken, String? idToken) async {
    final authCredentialBox = await Hive.openBox<Map>('authCredential');
    if (authCredentialBox.isNotEmpty) {
      await authCredentialBox.clear();
    }
    await authCredentialBox.add({
      "accessToken": accessToken,
      "idToken": idToken,
    });
    await authCredentialBox.close();
  }

  @override
  Future<Map<dynamic, dynamic>?> getFirebaseCredential() async {
    final authCredentialBox = await Hive.openBox<Map>('authCredential');
    final authCredential = authCredentialBox.get(0);

    return authCredential;
  }

  @override
  Future<void> saveUser(domain.User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}

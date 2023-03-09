import 'package:final_project_edspert/domain/users/i_user_repository.dart';
import 'package:final_project_edspert/domain/users/user.dart' as domain;
import 'package:final_project_edspert/infrastructure/users/user_dto.dart';
import 'package:hive/hive.dart';

class HiveUserRepo implements IUserRepository {
  @override
  Future<void> saveUser(domain.User user) async {
    final userBox = await Hive.openBox<Map<String, dynamic>>('user');
    if (userBox.isNotEmpty) {
      await userBox.clear();
    }
    await userBox.add(UserDto.fromDomain(user).toJson());
    await userBox.close();
  }

  @override
  Future<domain.User?> getUser() async {
    final userBox = await Hive.openBox<Map>('user');
    final user = userBox.get(0);
    await userBox.close();

    return user != null
        ? UserDto.fromJson(user.cast<String, dynamic>()).toDomain()
        : null;
  }

  @override
  Future<void> clear() async {
    for (var boxPath in ['user', 'banner', 'course', 'exercise']) {
      final box = await Hive.openBox<Map<String, dynamic>>(boxPath);
      await box.clear();
      await box.close();
    }
  }

  @override
  Future<void> update() {
    // TODO: implement update
    throw UnimplementedError();
  }
}

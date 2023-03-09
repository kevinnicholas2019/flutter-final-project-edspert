import 'package:final_project_edspert/domain/users/user.dart' as domain;
import 'package:final_project_edspert/infrastructure/users/hive_user_repo.dart';

abstract class IUserRepository {
  static final IUserRepository _instance = HiveUserRepo();
  factory IUserRepository() => _instance;

  Future<void> saveUser(domain.User user);
  Future<domain.User?> getUser();
  Future<void> clear();
  Future<void> update();
}

// import 'package:final_project_edspert/domain/banners/banner.dart';
// import 'package:final_project_edspert/domain/banners/i_banner_repository.dart';
// import 'package:final_project_edspert/domain/users/i_user_repository.dart';
// import 'package:final_project_edspert/domain/users/user.dart';
// import 'package:final_project_edspert/infrastructure/users/hive_user_repo.dart';
// import 'package:final_project_edspert/infrastructure/users/user_api.dart';

// class UserDataSource implements IUserRepository {
//   final _api = UserApi();
//   final _repo = HiveUserRepo();

//   @override
//   Future<void> clear() async {
//     await _repo.clear();
//   }

//   @override
//   Future<User?> getUser() {
//     // TODO: implement getUser
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> saveUser(User user) {
//     // TODO: implement saveUser
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> update() {
//     // TODO: implement update
//     throw UnimplementedError();
//   }

//   // @override
//   // Future<List<Banner>> getBanners() async {
//   //   try {
//   //     await _repo.saveBanners(await _api.getBanners());
//   //   } on Error catch (err) {
//   //     if (kDebugMode) {
//   //       print(err);
//   //     }
//   //     throw Error();
//   //   }
//   //   return await _repo.getBanners();
//   // }
// }

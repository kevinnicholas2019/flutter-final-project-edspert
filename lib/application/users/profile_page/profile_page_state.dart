part of 'profile_page_bloc.dart';

@immutable
abstract class ProfilePageState {
  final User user;
  final auth.User firebaseCredential;
  final bool isSubmitLogout;

  const ProfilePageState({
    required this.user,
    required this.firebaseCredential,
    this.isSubmitLogout = false,
  });
}

class ProfilePageInitial extends ProfilePageState {
  const ProfilePageInitial({
    required super.user,
    required super.firebaseCredential,
    super.isSubmitLogout = false,
  });
}

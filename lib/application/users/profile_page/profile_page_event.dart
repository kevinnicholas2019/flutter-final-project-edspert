part of 'profile_page_bloc.dart';

@immutable
abstract class ProfilePageEvent {}

class ProfilePageEventOnRefresh extends ProfilePageEvent {}

class ProfilePageOnLogout extends ProfilePageEvent {}

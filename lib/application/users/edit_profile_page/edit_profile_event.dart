part of 'edit_profile_bloc.dart';

@immutable
abstract class EditProfileEvent {}

class OnLoad implements EditProfileEvent {}

class OnUpdatePressed implements EditProfileEvent {}

class OnEmailChanged implements EditProfileEvent {
  final String value;

  OnEmailChanged(this.value);
}

class OnNamaLengkapChanged implements EditProfileEvent {
  final String value;

  OnNamaLengkapChanged(this.value);
}

class OnJenisKelaminChanged implements EditProfileEvent {
  final String value;

  OnJenisKelaminChanged(this.value);
}

class OnKelasChanged implements EditProfileEvent {
  final String value;

  OnKelasChanged(this.value);
}

class OnNamaSekolahChanged implements EditProfileEvent {
  final String value;

  OnNamaSekolahChanged(this.value);
}

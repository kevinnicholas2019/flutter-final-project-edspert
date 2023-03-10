part of 'register_page_bloc.dart';

abstract class RegisterPageEvent {}

class OnLoad implements RegisterPageEvent {}

class OnDaftarPressed implements RegisterPageEvent {}

class OnEmailChanged implements RegisterPageEvent {
  final String value;

  OnEmailChanged(this.value);
}

class OnNamaLengkapChanged implements RegisterPageEvent {
  final String value;

  OnNamaLengkapChanged(this.value);
}

class OnJenisKelaminChanged implements RegisterPageEvent {
  final String value;

  OnJenisKelaminChanged(this.value);
}

class OnKelasChanged implements RegisterPageEvent {
  final String value;

  OnKelasChanged(this.value);
}

class OnNamaSekolahChanged implements RegisterPageEvent {
  final String value;

  OnNamaSekolahChanged(this.value);
}

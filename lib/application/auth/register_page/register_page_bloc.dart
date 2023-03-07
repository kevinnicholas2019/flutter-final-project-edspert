// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_project_edspert/domain/users/value_objects.dart';

part 'register_page_event.dart';
part 'register_page_state.dart';

class RegisterPageBloc extends Bloc<RegisterPageEvent, RegisterPageState> {
  RegisterPageBloc() : super(RegisterPageState.initial()) {
    on<OnLoad>((event, emit) {
      emit(RegisterPageState(
        emailAddress: state.emailAddress,
        namaLengkap: state.namaLengkap,
        jenisKelamin: state.jenisKelamin,
        kelas: state.kelas,
        namaSekolah: state.namaSekolah,
      ));
    });

    on<OnDaftarPressed>((event, emit) {
      final isSafe = [
        state.emailAddress,
        state.jenisKelamin,
        state.kelas,
        state.namaLengkap,
        state.namaSekolah,
      ].fold(true, (previousValue, element) => element.failures().isEmpty);
      emit(RegisterPageState(
        emailAddress: state.emailAddress,
        namaLengkap: state.namaLengkap,
        jenisKelamin: state.jenisKelamin,
        kelas: state.kelas,
        namaSekolah: state.namaSekolah,
        isSubmited: isSafe,
      ));
    });

    on<OnEmailChanged>((event, emit) {
      emit(RegisterPageState(
        emailAddress: EmailAddress(event.value),
        namaLengkap: state.namaLengkap,
        jenisKelamin: state.jenisKelamin,
        kelas: state.kelas,
        namaSekolah: state.namaSekolah,
      ));
    });

    on<OnNamaLengkapChanged>((event, emit) {
      emit(RegisterPageState(
        emailAddress: state.emailAddress,
        namaLengkap: NamaLengkap(event.value),
        jenisKelamin: state.jenisKelamin,
        kelas: state.kelas,
        namaSekolah: state.namaSekolah,
      ));
    });

    on<OnJenisKelaminChanged>((event, emit) {
      emit(RegisterPageState(
        emailAddress: state.emailAddress,
        namaLengkap: state.namaLengkap,
        jenisKelamin: JenisKelamin(event.value),
        kelas: state.kelas,
        namaSekolah: state.namaSekolah,
      ));
    });

    on<OnKelasChanged>((event, emit) {
      emit(RegisterPageState(
        emailAddress: state.emailAddress,
        namaLengkap: state.namaLengkap,
        jenisKelamin: state.jenisKelamin,
        kelas: Kelas(event.value),
        namaSekolah: state.namaSekolah,
      ));
    });

    on<OnNamaSekolahChanged>((event, emit) {
      emit(RegisterPageState(
        emailAddress: state.emailAddress,
        namaLengkap: state.namaLengkap,
        jenisKelamin: state.jenisKelamin,
        kelas: state.kelas,
        namaSekolah: NamaSekolah(event.value),
      ));
    });
  }
}

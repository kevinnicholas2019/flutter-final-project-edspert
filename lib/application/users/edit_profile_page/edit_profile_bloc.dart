import 'package:bloc/bloc.dart';
import 'package:final_project_edspert/domain/users/i_user_repository.dart';
import 'package:final_project_edspert/domain/users/user.dart';
import 'package:final_project_edspert/domain/users/value_objects.dart';
import 'package:meta/meta.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final IUserRepository _userRepo = IUserRepository();

  EditProfileBloc() : super(EditProfileState.initial()) {
    on<OnUpdatePressed>((event, emit) async {
      final isSafe = [
        state.emailAddress,
        state.jenisKelamin,
        state.kelas,
        state.namaLengkap,
        state.namaSekolah,
      ].fold(
        true,
        (previousValue, element) => previousValue && element.failures().isEmpty,
      );
      emit(EditProfileState(
        emailAddress: state.emailAddress,
        namaLengkap: state.namaLengkap,
        jenisKelamin: state.jenisKelamin,
        kelas: state.kelas,
        namaSekolah: state.namaSekolah,
        isSubmited: isSafe,
      ));
      if (state.isSubmited) {
        User.currUser = User(
          emailAddress: state.emailAddress,
          namaLengkap: state.namaLengkap,
          jenisKelamin: state.jenisKelamin,
          kelas: state.kelas,
          namaSekolah: state.namaSekolah,
        );
        await _userRepo.saveUser(User.currentUser());
      }
    });

    on<OnEmailChanged>((event, emit) {
      emit(EditProfileState(
        emailAddress: EmailAddress(event.value),
        namaLengkap: state.namaLengkap,
        jenisKelamin: state.jenisKelamin,
        kelas: state.kelas,
        namaSekolah: state.namaSekolah,
      ));
    });

    on<OnNamaLengkapChanged>((event, emit) {
      emit(EditProfileState(
        emailAddress: state.emailAddress,
        namaLengkap: NamaLengkap(event.value),
        jenisKelamin: state.jenisKelamin,
        kelas: state.kelas,
        namaSekolah: state.namaSekolah,
      ));
    });

    on<OnJenisKelaminChanged>((event, emit) {
      emit(EditProfileState(
        emailAddress: state.emailAddress,
        namaLengkap: state.namaLengkap,
        jenisKelamin: JenisKelamin(event.value),
        kelas: state.kelas,
        namaSekolah: state.namaSekolah,
      ));
    });

    on<OnKelasChanged>((event, emit) {
      emit(EditProfileState(
        emailAddress: state.emailAddress,
        namaLengkap: state.namaLengkap,
        jenisKelamin: state.jenisKelamin,
        kelas: Kelas(event.value),
        namaSekolah: state.namaSekolah,
      ));
    });

    on<OnNamaSekolahChanged>((event, emit) {
      emit(EditProfileState(
        emailAddress: state.emailAddress,
        namaLengkap: state.namaLengkap,
        jenisKelamin: state.jenisKelamin,
        kelas: state.kelas,
        namaSekolah: NamaSekolah(event.value),
      ));
    });
  }
}

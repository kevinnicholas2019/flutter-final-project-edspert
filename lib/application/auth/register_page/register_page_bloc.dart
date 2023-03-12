import 'package:bloc/bloc.dart';
import 'package:final_project_edspert/domain/users/i_user_repository.dart';
import 'package:final_project_edspert/domain/users/user.dart';
import 'package:final_project_edspert/domain/users/value_objects.dart';

part 'register_page_event.dart';
part 'register_page_state.dart';

class RegisterPageBloc extends Bloc<RegisterPageEvent, RegisterPageState> {
  final IUserRepository _userRepo = IUserRepository();

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

    on<OnDaftarPressed>((event, emit) async {
      var isSafe = [
        state.emailAddress,
        state.jenisKelamin,
        state.kelas,
        state.namaLengkap,
        state.namaSekolah,
      ].fold(
        true,
        (previousValue, element) => previousValue && element.failures().isEmpty,
      );
      if (isSafe) {
        await _userRepo.saveUser(
          User(
            emailAddress: state.emailAddress,
            namaLengkap: state.namaLengkap,
            jenisKelamin: state.jenisKelamin,
            kelas: state.kelas,
            namaSekolah: state.namaSekolah,
          ),
        );
        final userRepo = await _userRepo.getUser();
        if (userRepo != null) {
          User.currUser = userRepo;
        } else {
          isSafe = false;
        }
        emit(RegisterPageState(
          emailAddress: state.emailAddress,
          namaLengkap: state.namaLengkap,
          jenisKelamin: state.jenisKelamin,
          kelas: state.kelas,
          namaSekolah: state.namaSekolah,
          isSubmited: isSafe,
        ));
      }
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

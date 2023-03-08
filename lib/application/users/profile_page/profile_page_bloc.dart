import 'package:bloc/bloc.dart';
import 'package:final_project_edspert/domain/auth/i_auth_facade.dart';
import 'package:final_project_edspert/domain/users/user.dart';
import 'package:final_project_edspert/domain/users/value_objects.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  final IAuthFacade authFacade = IAuthFacade();

  ProfilePageBloc()
      : super(
          ProfilePageInitial(
            user: User.currentUser(),
            firebaseCredential: User.firebaseCredential(),
          ),
        ) {
    on<ProfilePageEventOnRefresh>((event, emit) async {
      emit(
        ProfilePageInitial(
          user: User.currentUser(),
          firebaseCredential: User.firebaseCredential(),
        ),
      );
    });

    on<ProfilePageOnLogout>((event, emit) async {
      await authFacade.signOut();
      if (state is ProfilePageInitial) {
        final thisState = state as ProfilePageInitial;
        emit(ProfilePageInitial(
          user: thisState.user,
          firebaseCredential: thisState.firebaseCredential,
          isSubmitLogout: true,
        ));
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:fic_akatalog_final/data/datasources/auth_datasources.dart';
import 'package:fic_akatalog_final/data/models/response/profile_response_model.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthDatasources authDatasource;
  ProfileBloc(
    this.authDatasource,
  ) : super(ProfileInitial()) {
    on<GetProfileEvent>((event, emit) async {
      try {
        emit(ProfileLoading());
        final result = await authDatasource.getProfile();
        emit(ProfileLoaded(profileResponseModel: result));
      } catch (e) {
        emit(ProfileError(message: 'network problem: ${e.toString()}'));
      }
    });
  }
}

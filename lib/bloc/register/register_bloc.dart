import 'package:bloc/bloc.dart';
import 'package:fic_akatalog_final/data/datasources/auth_datasources.dart';
import 'package:fic_akatalog_final/data/models/request/register_model.dart';
import 'package:fic_akatalog_final/data/models/response/register_response_model.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDatasources authDatasources;
  RegisterBloc({required this.authDatasources}) : super(RegisterInitial()) {
    on<SaveRegisterEvent>((event, emit) async {
      // TODO: implement event handler
      emit(RegisterLoading());
      final result = await authDatasources.register(event.registerModel);
      print(result);
      emit(RegisterLoaded(registerResponseModel: result));
    });
  }
}

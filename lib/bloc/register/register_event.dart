part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

// save register event ketika click register
class SaveRegisterEvent extends RegisterEvent {
  final RegisterModel registerModel;
  SaveRegisterEvent({required this.registerModel});
}

part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileResponseModel profileResponseModel;
  ProfileLoaded({required this.profileResponseModel});
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError({required this.message});
}

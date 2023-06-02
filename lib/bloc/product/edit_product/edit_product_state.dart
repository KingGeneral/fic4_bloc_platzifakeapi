part of 'edit_product_bloc.dart';

@immutable
abstract class EditProductState {}

class EditProductInitial extends EditProductState {}

class EditProductLoading extends EditProductState {}

class EditProductLoaded extends EditProductState {
  final ProductResponseModel productResponseModel;
  EditProductLoaded({required this.productResponseModel});
}

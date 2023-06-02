part of 'edit_product_bloc.dart';

@immutable
abstract class EditProductEvent {}

class DoEditProductEvent extends EditProductEvent {
  final ProductModel productModel;
  final int id;

  DoEditProductEvent({required this.productModel, required this.id});
}

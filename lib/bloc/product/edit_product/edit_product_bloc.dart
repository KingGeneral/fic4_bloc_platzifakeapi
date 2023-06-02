import 'package:bloc/bloc.dart';
import 'package:fic_akatalog_final/data/datasources/product_datasources.dart';
import 'package:fic_akatalog_final/data/models/request/product_model.dart';
import 'package:fic_akatalog_final/data/models/response/product_response_model.dart';
import 'package:meta/meta.dart';

part 'edit_product_event.dart';
part 'edit_product_state.dart';

class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  final ProductDatasources productDatasources;

  EditProductBloc(this.productDatasources) : super(EditProductInitial()) {
    on<DoEditProductEvent>((event, emit) async {
      emit(EditProductLoading());
      final result =
          await productDatasources.updateProduct(event.productModel, event.id);
      emit(EditProductLoaded(productResponseModel: result));
    });
  }
}

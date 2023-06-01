import 'package:bloc/bloc.dart';
import 'package:fic_akatalog_final/data/datasources/product_datasources.dart';
import 'package:fic_akatalog_final/data/models/request/product_model.dart';
import 'package:fic_akatalog_final/data/models/response/product_response_model.dart';
import 'package:meta/meta.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final ProductDatasources productDatasources;
  CreateProductBloc(
    this.productDatasources,
  ) : super(CreateProductInitial()) {
    on<DoCreateProductEvent>((event, emit) async {
      emit(CreateProductLoading());
      final result = await productDatasources.createProduct(event.productModel);
      emit(CreateProductLoaded(productResponseModel: result));
    });
  }
}

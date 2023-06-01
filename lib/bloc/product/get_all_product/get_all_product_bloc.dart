import 'package:bloc/bloc.dart';
import 'package:fic_akatalog_final/data/datasources/product_datasources.dart';
import 'package:fic_akatalog_final/data/models/response/product_response_model.dart';
import 'package:meta/meta.dart';

part 'get_all_product_event.dart';
part 'get_all_product_state.dart';

class GetAllProductBloc extends Bloc<GetAllProductEvent, GetAllProductState> {
  final ProductDatasources productDatasources;
  GetAllProductBloc(
    this.productDatasources,
  ) : super(GetAllProductInitial()) {
    on<DoGetAllProductEvent>((event, emit) async {
      emit(GetAllProductLoading());
      final result = await productDatasources.getAllProduct();
      emit(GetAllProductLoaded(listProduct: result));
    });
  }
}

import 'package:fic_akatalog_final/bloc/product/get_all_product/get_all_product_bloc.dart';
import 'package:flutter/material.dart';

import 'package:fic_akatalog_final/data/models/request/product_model.dart';
import 'package:fic_akatalog_final/data/models/response/product_response_model.dart';
import 'package:fic_akatalog_final/presentation/pages/product_edit_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;
  final int productid;

  const ProductDetailPage({
    required this.product,
    required this.productid,
  });

  // Fungsi untuk menangani tombol Edit
  void handleEdit(BuildContext context) async {
    final updatedProduct = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ProductEditPage(product: product, productId: productid),
      ),
    );

    // Memperbarui tampilan data
    if (updatedProduct != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailPage(
            product: updatedProduct,
            productid: productid,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // _refreshData saat kembali
        context.read<GetAllProductBloc>().add(DoGetAllProductEvent());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Detail'),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => handleEdit(context),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'Product ID: $productid',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Product Title: ' + product.title,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Product Description: ' + product.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Product Price: ${product.price}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

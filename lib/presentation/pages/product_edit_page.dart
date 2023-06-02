import 'package:fic_akatalog_final/bloc/product/edit_product/edit_product_bloc.dart';
import 'package:fic_akatalog_final/data/models/request/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductEditPage extends StatefulWidget {
  final ProductModel product;
  final int productId;
  ProductEditPage({required this.product, required this.productId});

  @override
  State<ProductEditPage> createState() => _ProductEditPageState();
}

class _ProductEditPageState extends State<ProductEditPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    // Inisialisasi
    titleController.text = widget.product.title;
    descriptionController.text = widget.product.description;
    priceController.text = widget.product.price.toString();

    super.initState();
  }

  @override
  void dispose() {
    // Hapus controller
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: BlocBuilder<EditProductBloc, EditProductState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Product Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration:
                      const InputDecoration(labelText: 'Product Description'),
                  maxLines: 3,
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Product Price'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Simpan perubahan produk
                    final updatedProduct = ProductModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      price: int.tryParse(priceController.text) ?? 0,
                    );

                    final productModel = ProductModel(
                      title: titleController.text,
                      price: int.parse(priceController.text),
                      description: descriptionController.text,
                    );
                    context.read<EditProductBloc>().add(DoEditProductEvent(
                        productModel: updatedProduct, id: widget.productId));

                    // Kembali ke halaman sebelumnya
                    Navigator.pop(context, updatedProduct);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

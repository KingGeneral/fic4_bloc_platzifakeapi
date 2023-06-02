import 'package:fic_akatalog_final/bloc/product/create_product/create_product_bloc.dart';
import 'package:fic_akatalog_final/bloc/product/get_all_product/get_all_product_bloc.dart';
import 'package:fic_akatalog_final/bloc/profile/profile_bloc.dart';
import 'package:fic_akatalog_final/data/localsources/auth_local_storage.dart';
import 'package:fic_akatalog_final/data/models/request/product_model.dart';
import 'package:fic_akatalog_final/presentation/pages/login_page.dart';
import 'package:fic_akatalog_final/presentation/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileEvent());
    context.read<GetAllProductBloc>().add(DoGetAllProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Profile'),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthLocalStorage().removeToken();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }));
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProfileLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.profileResponseModel.name ?? ''),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(state.profileResponseModel.email ?? ''),
                ],
              );
            }

            return const Text('no data');
          }),
          Expanded(child: BlocBuilder<GetAllProductBloc, GetAllProductState>(
            builder: (context, state) {
              if (state is GetAllProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetAllProductLoaded) {
                return ListView.builder(itemBuilder: ((context, index) {
                  if (index >= 0 && index < state.listProduct.length) {
                    final product = state.listProduct.reversed.toList()[index];

                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${product.price}')),
                        title: Text(product.title ?? '-'),
                        subtitle: Text(product.description ?? '-'),
                        onTap: () {
                          // convert
                          final productModel = ProductModel(
                            title: product.title ?? '-',
                            description: product.description ?? '-',
                            price: product.price ?? 0,
                          );
                          // tampilan detail produk
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailPage(product: productModel)),
                          );
                        },
                      ),
                    );

                    // return Card(
                    //   child: ListTile(
                    //     leading: CircleAvatar(child: Text('${product.price}')),
                    //     title: Text(product.title ?? '-'),
                    //     subtitle: Text(product.description ?? '-'),
                    //   ),
                    // );
                  } else {
                    // Penanganan ketika indeks di luar rentang
                    // return const Text('no data');
                    return const SizedBox(
                      height: 1.0,
                    );
                  }
                }));
              }
              return const Text('no data');
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add Product'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: const InputDecoration(labelText: 'Title'),
                        controller: titleController,
                      ),
                      TextField(
                        decoration: const InputDecoration(labelText: 'Price'),
                        controller: priceController,
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        maxLines: 3,
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                        controller: descriptionController,
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    BlocListener<CreateProductBloc, CreateProductState>(
                      listener: (context, state) {
                        if (state is CreateProductLoaded) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('${state.productResponseModel.id}')));
                          Navigator.pop(context);
                          context
                              .read<GetAllProductBloc>()
                              .add(DoGetAllProductEvent());
                        }
                      },
                      child: BlocBuilder<CreateProductBloc, CreateProductState>(
                        builder: (context, state) {
                          if (state is CreateProductLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ElevatedButton(
                            onPressed: () {
                              final productModel = ProductModel(
                                title: titleController.text,
                                price: int.parse(priceController.text),
                                description: descriptionController.text,
                              );
                              context.read<CreateProductBloc>().add(
                                  DoCreateProductEvent(
                                      productModel: productModel));

                              // context
                              //     .read<GetAllProductBloc>()
                              //     .add(DoGetAllProductEvent());
                            },
                            child: const Text('Save'),
                          );
                        },
                      ),
                    ),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

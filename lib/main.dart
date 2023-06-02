import 'package:fic_akatalog_final/bloc/login/login_bloc.dart';
import 'package:fic_akatalog_final/bloc/product/create_product/create_product_bloc.dart';
import 'package:fic_akatalog_final/bloc/product/get_all_product/get_all_product_bloc.dart';
import 'package:fic_akatalog_final/bloc/profile/profile_bloc.dart';
import 'package:fic_akatalog_final/bloc/register/register_bloc.dart';
import 'package:fic_akatalog_final/data/datasources/auth_datasources.dart';
import 'package:fic_akatalog_final/data/datasources/product_datasources.dart';
import 'package:fic_akatalog_final/presentation/pages/login_page.dart';
import 'package:fic_akatalog_final/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthDatasources()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(authDatasources: AuthDatasources()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(AuthDatasources()),
        ),
        BlocProvider(
          create: (context) => CreateProductBloc(ProductDatasources()),
        ),
        BlocProvider(
          create: (context) => GetAllProductBloc(ProductDatasources()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter A Akatalog',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}

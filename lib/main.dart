import 'package:fic_akatalog_final/bloc/register/register_bloc.dart';
import 'package:fic_akatalog_final/data/datasources/api_datasources.dart';
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
          create: (context) => RegisterBloc(apiDatasources: ApiDatasources()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter A Akatalog',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const RegisterPage(),
      ),
    );
  }
}

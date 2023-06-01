import 'package:fic_akatalog_final/bloc/register/register_bloc.dart';
import 'package:fic_akatalog_final/data/models/request/register_model.dart';
import 'package:fic_akatalog_final/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // create controller name email password
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  // overide initstate with controller init
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  //dispose all
  @override
  void dispose() {
    nameController!.dispose();
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                )),
            TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                )),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 16.0,
            ),
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                // clear all controller
                nameController!.clear();
                emailController!.clear();
                passwordController!.clear();

                // show snackbar
                if (state is RegisterLoaded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'success register with id: ${state.registerResponseModel.id}')),
                  );

                  // move to login page
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }));
                }
              },
              builder: (context, state) {
                if (state is RegisterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                  onPressed: () {
                    final requestModel = RegisterModel(
                      name: nameController!.text,
                      email: emailController!.text,
                      password: passwordController!.text,
                    );

                    context.read<RegisterBloc>().add(
                          SaveRegisterEvent(
                            registerModel: requestModel,
                          ),
                        );
                  },
                  child: const Text('Register'),
                );
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            InkWell(
              onTap: () {
                // push loginpage
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }));
              },
              child: const Text(
                'ke Login',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
}

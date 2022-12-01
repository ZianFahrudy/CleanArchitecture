import 'dart:developer';

import 'package:fl_clean_arch/common/gen/assets.gen.dart';
import 'package:fl_clean_arch/common/gen/colors.gen.dart';
import 'package:fl_clean_arch/core/di/injection.dart';
import 'package:fl_clean_arch/features/auth/data/models/request/login_body.dart';
import 'package:fl_clean_arch/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  final authBloc = sl<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authBloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginSuccess) {
            log('login success');
          } else if (state is AuthFailure) {
            log('login failure');
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                  ),
                  TextField(
                    controller: passController,
                  ),
                  Text(dotenv.env['BASE_URL'].toString()),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      authBloc.add(
                        LoginEvent(
                          body: LoginBody(
                            email: emailController.text,
                            password: passController.text,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: MyColor.black),
                    ),
                  ),
                  MyAssets.icon.demoIcon.image(width: 100),
                  MyAssets.splash.splashLogo.image(width: 200)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

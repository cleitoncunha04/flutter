import 'package:bloc_login_app/bloc/auth_bloc.dart';
import 'package:bloc_login_app/home_screen.dart';
import 'package:bloc_login_app/widgets/custom_loading.dart';
import 'package:bloc_login_app/widgets/custom_snackbar.dart';
import 'package:bloc_login_app/widgets/gradient_button.dart';
import 'package:bloc_login_app/widgets/login_field.dart';
import 'package:bloc_login_app/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    context.read<AuthBloc>().add(
          LoginAuthEvent(
            rawEmail: emailController.text.trim(),
            rawPassword: passwordController.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              CustomSnackbar(
                message: 'Successfully logged in...',
                context: context,
              ).show();

              Future.delayed(
                const Duration(milliseconds: 1800),
              ).then((_) {
                if (context.mounted) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => const HomeScreen(),
                    ),
                  );
                }
              });
            });
          }

          if (state is AuthFailure) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              CustomSnackbar(
                message: state.message,
                context: context,
                isError: true,
              ).show();
            });
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const CustomLoading();
          }
          return SingleChildScrollView(
            child: Center(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset('assets/images/signin_balls.png'),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 130,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Sign in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                        const SizedBox(height: 50),
                        const SocialButton(
                            iconPath: 'assets/svgs/g_logo.svg',
                            label: 'Continue with Google'),
                        const SizedBox(height: 20),
                        const SocialButton(
                          iconPath: 'assets/svgs/f_logo.svg',
                          label: 'Continue with Facebook',
                          horizontalPadding: 90,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'or',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 15),
                        LoginField(
                          hintText: 'Email',
                          controller: emailController,
                        ),
                        const SizedBox(height: 15),
                        LoginField(
                          hintText: 'Password',
                          controller: passwordController,
                          isPassword: true,
                        ),
                        const SizedBox(height: 20),
                        GradientButton(
                          onTap: login,
                          text: 'Sign in',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

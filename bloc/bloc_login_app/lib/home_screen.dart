import 'package:bloc_login_app/bloc/auth_bloc.dart';
import 'package:bloc_login_app/login_screen.dart';
import 'package:bloc_login_app/pallete.dart';
import 'package:bloc_login_app/widgets/custom_loading.dart';
import 'package:bloc_login_app/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthInitial) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const LoginScreen(),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const CustomLoading();
            }

            if (state is AuthSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    color: Pallete.whiteColor,
                    size: 96,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Text(
                      state.email.toString(),
                      style: const TextStyle(
                        color: Pallete.whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GradientButton(
                    onTap: () {
                      context.read<AuthBloc>().add(
                            LogoutAuthEvent(),
                          );
                    },
                    text: 'Logout',
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

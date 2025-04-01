import 'package:bloc_login_app/model/email_model.dart';
import 'package:bloc_login_app/model/password_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginAuthEvent>(
      _onLoginAuthEvent,
    );

    on<LogoutAuthEvent>(
      _onLogoutAuthEvent,
    );
  }

  Future<void> _onLoginAuthEvent(
    LoginAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(
        AuthLoading(),
      );

      await Future.delayed(
        const Duration(
          milliseconds: 1500,
        ),
      );

      emit(
        AuthSuccess(
          email: EmailModel(
            value: event.rawEmail,
          ),
          password: PasswordModel(
            value: event.rawPassword,
          ),
        ),
      );
    } catch (e) {
      emit(
        AuthFailure(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLogoutAuthEvent(
    LogoutAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      AuthLoading(),
    );

    await Future.delayed(
      const Duration(
        milliseconds: 1500,
      ),
    );

    emit(
      AuthInitial(),
    );
  }
}

part of 'signin_cubit.dart';

@immutable
class SignInState extends Equatable {
  final bool isLoggedIn;
  final bool isProcessing;
  final User? user;
  final String? email;
  final String? password;

  const SignInState(
      {required this.isLoggedIn,
      required this.isProcessing,
      this.user,
      this.email,
      this.password});

  const SignInState.init(
      {required this.isLoggedIn,
      required this.isProcessing,
      this.user,
      this.email,
      this.password});

  SignInState copyWith(
      {bool? isLoggedIn,
      bool? isProcessing,
      User? user,
      String? email,
      String? password}) {
    return SignInState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isProcessing: isProcessing ?? this.isProcessing,
      user: user ?? this.user,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [isLoggedIn, isProcessing, user, email, password];
}

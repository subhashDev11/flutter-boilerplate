part of 'signup_controller_cubit.dart';

class SignUpState extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final bool obSecurePassword;
  final File? pickedProfilePic;
  final bool visiblePassword;
  final bool visibleConfirmPassword;
  final String? gender;

  const SignUpState({
    this.name,
    this.email,
    this.gender,
    this.password,
    this.confirmPassword,
    this.pickedProfilePic,
    required this.obSecurePassword,
    required this.visiblePassword,
    required this.visibleConfirmPassword,
  });

  const SignUpState.init({
    this.name,
    this.email,
    this.gender,
    this.password,
    this.confirmPassword,
    this.pickedProfilePic,
    required this.obSecurePassword,
    required this.visiblePassword,
    required this.visibleConfirmPassword,
  });

  SignUpState copyWith({
    String? name,
    String? email,
    String? gender,
    String? password,
    String? confirmPassword,
    bool? obSecurePassword,
    File? pickedProfilePic,
    bool? visiblePassword,
    bool? visibleConfirmPassword,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      pickedProfilePic: pickedProfilePic ?? this.pickedProfilePic,
      obSecurePassword: obSecurePassword ?? this.obSecurePassword,
      visibleConfirmPassword: visibleConfirmPassword ?? this.visibleConfirmPassword,
      visiblePassword: visiblePassword ?? this.visiblePassword,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        email,
        password,
        confirmPassword,
        obSecurePassword,
        pickedProfilePic,
        visiblePassword,
        visibleConfirmPassword,
      ];
}

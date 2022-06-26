import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyam_services/ui/presentation/screens/signin_screen.dart';
import '../../../styles/text_styles.dart';
import '../cubits/signup_cubit/signup_controller_cubit.dart';
import '../widgets/custom_radio_group.dart';
import '../widgets/primary_button.dart';
import '../widgets/register_screen/custom_form_text_field.dart';

const genders = ["Male", "Female", "Other"];

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  late final SignUpCubit signUpCubit;

  @override
  void initState() {
    signUpCubit = context.read<SignUpCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 100,
            centerTitle: true,
            backgroundColor: theme.scaffoldBackgroundColor,
            leading: const SizedBox(
              width: 1,
            ),
            leadingWidth: 0,
            title: Padding(
                padding: EdgeInsets.zero,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    tr('sign_up'),
                    style: TextStyles.titleTextStyle.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                )),
          ),
          body: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: theme.brightness == Brightness.light
                                    ? Colors.black12
                                    : Colors.white10,
                                offset: const Offset(0.0, 15.0),
                                blurRadius: 15.0),
                            BoxShadow(
                                color: theme.brightness == Brightness.light
                                    ? Colors.black12
                                    : Colors.white10,
                                offset: const Offset(0.0, -10.0),
                                blurRadius: 10.0),
                          ]),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(
                              height: 50,
                            ),
                            CustomTextFormField(
                              validationCallback: signUpCubit.validateName,
                              onChangedCallback: signUpCubit.onNameChange,
                              onSubmitCallback: (value) {},
                              hintText: tr('name'),
                              isLast: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              validationCallback: signUpCubit.validateEmail,
                              onChangedCallback: signUpCubit.onEmailChange,
                              onSubmitCallback: (value) {},
                              hintText: tr('email'),
                              isLast: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              validationCallback: signUpCubit.validatePassword,
                              onChangedCallback: signUpCubit.onPasswordChange,
                              onSubmitCallback: (value) {},
                              hintText: tr('password'),
                              obSecurePassword: !state.visiblePassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  state.visiblePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: theme.primaryColorDark,
                                ),
                                onPressed: signUpCubit.changePasswordVisibility,
                              ),
                              isLast: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              validationCallback:
                                  signUpCubit.validateConfirmPassword,
                              onChangedCallback:
                                  signUpCubit.onConfirmPasswordChange,
                              onSubmitCallback: (value) {},
                              obSecurePassword: !state.visibleConfirmPassword,
                              hintText: tr('confirm_password'),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  state.visibleConfirmPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: theme.primaryColorDark,
                                ),
                                onPressed:
                                    signUpCubit.changeConfirmPasswordVisibility,
                              ),
                              isLast: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                    tr('gender'),
                                   style: TextStyles.titleTextStyle.copyWith(
                                     fontSize: 18,
                                     fontWeight: FontWeight.w600,
                                   ),
                                ),
                            ),
                            CustomRadioGroup(
                                titles: genders,
                                labelVisible: false,
                                activeColor: theme.primaryColor,
                                onChanged: (index) {},
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PrimaryButton(
                                disable: isDisable(),
                                onTap: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const SignInScreen()));
                                  }
                                },
                                title: tr('sign_up'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const SignInScreen()));
                                },
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: tr('already_have_account'),
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  TextSpan(
                                    text: tr('sign_in'),
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      color: theme.primaryColor,
                                    ),
                                  ),
                                ])),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),

                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: InkWell(
                        onTap: () {
                          signUpCubit.pickProfileImage(context);
                        },
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: theme.primaryColor,
                                backgroundImage: state.pickedProfilePic != null
                                    ? Image.file(
                                        state.pickedProfilePic!,
                                        fit: BoxFit.cover,
                                      ).image
                                    : const AssetImage(
                                        'assets/images/placeholder_image.jpeg',
                                      ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.edit,
                                  size: 35,
                                  color: theme.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  isDisable() {
    if (_formKey.currentState?.validate() ?? false) {
      return false;
    }
    return true;
  }
}

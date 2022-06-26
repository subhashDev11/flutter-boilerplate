import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyam_services/locator.dart';
import 'package:hyam_services/router/app_routes.gr.dart';
import '../../../styles/text_styles.dart';
import '../cubits/sign_in_cubit/signin_cubit.dart';
import '../widgets/primary_button.dart';
import '../widgets/register_screen/custom_form_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _signFormKey = GlobalKey<FormState>();
  late final SignInCubit signInCubit;

  @override
  void initState() {
    signInCubit = context.read<SignInCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SignInCubit, SignInState>(
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
                      tr('sign_in'),
                      style: TextStyles.titleTextStyle.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  )),
            ),
            body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
              return Form(
                key: _signFormKey,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: constraints.maxHeight * 0.1, left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 15.0),
                            blurRadius: 15.0),
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, -10.0),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            validationCallback: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              }
                              return 'Email is required!';
                            },
                            onChangedCallback: signInCubit.onEmailInputChanged,
                            onSavedCallback: (value) {},
                            hintText: tr('email'),
                            isLast: false,
                            onSubmitCallback: (String? value) {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            validationCallback: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              }
                              return 'Password is required!';
                            },
                            onChangedCallback:
                                signInCubit.onPasswordInputChanged,
                            onSavedCallback: (value) {},
                            hintText: tr('password'),
                            isLast: true,
                            onSubmitCallback: (String? value) {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PrimaryButton(
                              onTap: () {
                                signInCubit.loginFunc();
                              },
                              title: state.isProcessing
                                  ? tr('processing_message')
                                  : tr('sign_in'),
                              disable: isDisable(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                getItInjector<AppRouter>()
                                    .replaceNamed('/sign-up-screen');
                              },
                              child: Text(
                                tr('no_account'),
                                textAlign: TextAlign.center,
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
      },
    );
  }

  isDisable() {
    if (_signFormKey.currentState?.validate() ?? false) {
      return false;
    }
    return true;
  }
}

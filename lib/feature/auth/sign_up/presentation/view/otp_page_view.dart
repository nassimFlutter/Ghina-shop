import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/auth/login/presentation/view/pages/login_page_view.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../manager/sign_up/sign_up_cubit.dart';

class OtpPageView extends StatefulWidget {
  final String? phoneOrEmail;
  const OtpPageView({Key? key, this.phoneOrEmail}) : super(key: key);

  @override
  State<OtpPageView> createState() => _OtpPageViewState();
}

class _OtpPageViewState extends State<OtpPageView> {
  String _otp = '';
  String? _error;

  void _submit(BuildContext context) {
    if (_otp.length != 5 || _otp.contains(RegExp(r'[^0-9]'))) {
      setState(() {
        _error = S.of(context).verify_otp_error;
      });
      return;
    }
    final cubit = SignUpCubit.get(context);
    cubit.verifyCode(widget.phoneOrEmail ?? '', _otp);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).verify_otp),
        backgroundColor: AppColor.yalow,
        centerTitle: true,
      ),
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            HelperFunctions.navigateToScreenAndRemove(
                context, const LoginView());
          }
          if (state is SignUpFailure) {
            setState(() {
              _error = state.errMessage;
            });
          }
        },
        builder: (context, state) {
          final isLoading = state is SignUpLoading;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).verify_otp_message,
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                OtpTextField(
                  autoFocus: true,
                  numberOfFields: 5,
                  borderColor: AppColor.yalow,
                  focusedBorderColor: AppColor.yalow,
                  cursorColor: AppColor.yalow,
                  showFieldAsBox: true,
                  borderRadius: BorderRadius.circular(8),
                  fieldWidth: 48,
                  onCodeChanged: (code) {
                    setState(() {
                      _error = null;
                      _otp = code;
                    });
                  },
                  onSubmit: (code) {
                    setState(() {
                      _otp = code;
                    });
                    _submit(context);
                  },
                ),
                const SizedBox(height: 16),
                if (_error != null)
                  Text(
                    _error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.yalow,
                    ),
                    onPressed: isLoading ? null : () => _submit(context),
                    child: isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Verify'),
                  ),
                ),
                // Uncomment if you want to add resend functionality:
                // const SizedBox(height: 16),
                // TextButton(
                //   onPressed: isLoading ? null : _resend,
                //   child: const Text('Resend Code'),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}

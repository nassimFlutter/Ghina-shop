import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/sign_up/sign_up_cubit.dart';

class OtpPageView extends StatefulWidget {
  final String? phoneOrEmail;
  const OtpPageView({Key? key, this.phoneOrEmail}) : super(key: key);

  @override
  State<OtpPageView> createState() => _OtpPageViewState();
}

class _OtpPageViewState extends State<OtpPageView> {
  final List<TextEditingController> _controllers =
      List.generate(5, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());
  String? _error;

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(int idx, String value) {
    if (value.length == 1 && idx < 4) {
      _focusNodes[idx + 1].requestFocus();
    }
    if (value.isEmpty && idx > 0) {
      _focusNodes[idx - 1].requestFocus();
    }
    setState(() {
      _error = null;
    });
  }

  void _submit(BuildContext context) async {
    final otp = _controllers.map((c) => c.text).join();
    if (otp.length != 5 || otp.contains(RegExp(r'[^0-9]'))) {
      setState(() {
        _error = S.of(context).verify_otp_error;
      });
      return;
    }
    final cubit = SignUpCubit.get(context);
    cubit.verifyCode(widget.phoneOrEmail ?? '', otp);
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
          if (state is SignUpSuccess && state.statueMessage) {
          } else if (state is SignUpFailure) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (i) {
                    return Container(
                      width: 48,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: TextFormField(
                        controller: _controllers[i],
                        focusNode: _focusNodes[i],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: theme.textTheme.headlineMedium,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(1),
                        ],
                        decoration: InputDecoration(
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (v) => _onChanged(i, v),
                      ),
                    );
                  }),
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

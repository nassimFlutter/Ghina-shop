import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';

class NoInterNetView extends StatelessWidget {
  const NoInterNetView({super.key});
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        S.of(context).no_internet, // "No internet",
      ),
    );
  }
}

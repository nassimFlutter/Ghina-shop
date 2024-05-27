import 'package:flutter/material.dart';
import '../widgets/new_arrivers_view_body.dart';

class NewArriversView extends StatelessWidget {
  const NewArriversView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: NewArriversViewBody()),
    );
  }
}

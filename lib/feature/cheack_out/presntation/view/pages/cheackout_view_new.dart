import 'package:best_price/feature/cheack_out/presntation/manager/add_order_cubit/add_order_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'check_out_page_body_new.dart';

class CheckOutPageNew extends StatelessWidget {
  const CheckOutPageNew({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(),
      child: const Scaffold(
        body: CheckOutPageBodyNew(),
      ),
    );
  }
}

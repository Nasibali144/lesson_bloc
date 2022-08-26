import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';
import 'counter_one_page.dart';

void main() {
  runApp(const CubitCounter());
}

class CubitCounter extends StatelessWidget {
  const CubitCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const MaterialApp(
        home: CounterOnePage(),
      ),
    );
  }
}

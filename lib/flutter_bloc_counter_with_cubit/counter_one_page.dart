import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';

class CounterOnePage extends StatelessWidget {
  const CounterOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cubit Counter"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: bloc.decrement,
              icon: const Icon(CupertinoIcons.minus, size: 30,),
            ),

            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(state.toString(), style: const TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),);
              }
            ),

            IconButton(
              onPressed: bloc.increment,
              icon: const Icon(CupertinoIcons.plus, size: 30,),
            )
          ],
        ),
      ),
    );
  }
}

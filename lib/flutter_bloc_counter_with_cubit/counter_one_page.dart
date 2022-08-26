import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';

class CounterOnePage extends StatelessWidget {
  const CounterOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var bloc = BlocProvider.of<CounterCubit>(context);
    var bloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cubit Counter"),
      ),
      body: Center(
        child: BlocListener<CounterBloc, int>(
          listener: (context, state) {
            if(state == 0) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("State: $state")));
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => bloc.add(CounterDecrementPressed()),
                icon: const Icon(CupertinoIcons.minus, size: 30,),
              ),

              BlocBuilder<CounterBloc, int>(
                bloc: bloc,
                buildWhen: (oldState, newState) {
                  return true;
                },
                builder: (context, state) {
                  return Text(state.toString(), style: const TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),);
                }
              ),

              IconButton(
                onPressed: () => bloc.add(CounterIncrementPressed()),
                icon: const Icon(CupertinoIcons.plus, size: 30,),
              )
            ],
          ),
        ),
      ),
    );
  }
}

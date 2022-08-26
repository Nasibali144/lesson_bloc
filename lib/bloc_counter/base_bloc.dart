import 'package:flutter/material.dart';

abstract class BlocBase{
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  final T bloc;
  final Widget child;

  const BlocProvider({
    Key? key,
    required this.child,
    required this.bloc,
  }): super(key: key);

  static T of<T extends BlocBase>(BuildContext context){
    BlocProvider<T> provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>()!;
    return provider.bloc;
  }

  @override
  State<BlocProvider<BlocBase>> createState() => _BlocProviderState<T>();
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>>{
  @override
  void dispose(){
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return widget.child;
  }
}

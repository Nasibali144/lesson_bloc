// event
import 'package:bloc/bloc.dart';

abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

// state => int

// bloc
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on((event, emit) {
      if(event is CounterIncrementPressed) {
        emit(state + 1);
      } else {
        addError(Exception('increment error!'), StackTrace.current);
        emit(state - 1);
      }
    });
  }



  // @override
  // void onChange(Change<int> change) {
  //   super.onChange(change);
  //   print(change);
  // }
  //
  // @override
  // void onTransition(Transition<CounterEvent, int> transition) {
  //   super.onTransition(transition);
  //   print(transition);
  // }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('${bloc.runtimeType} $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}


void main() async {
  Bloc.observer = SimpleBlocObserver();
  final bloc = CounterBloc();
  print(bloc.state); // 0

  bloc.add(CounterDecrementPressed());

  await Future.delayed(Duration.zero);
  print(bloc.state); // 1
  await bloc.close();
}

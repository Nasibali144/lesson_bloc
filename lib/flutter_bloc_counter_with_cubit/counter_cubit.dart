// import 'package:bloc/bloc.dart';
//
// class CounterCubit extends Cubit<int> {
//
//   CounterCubit() : super(0);
//
//   void increment() {
//     emit(state + 1);
//   }
//
//   void decrement() {
//     emit(state - 1);
//   }
//
//   @override
//   void onChange(Change<int> change) {
//     super.onChange(change);
//     print(change);
//   }
// }


import 'package:bloc/bloc.dart';

abstract class CounterEvent {}
class CounterIncrementPressed extends CounterEvent {}
class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }
}

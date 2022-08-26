import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class CounterCubit extends Cubit<int> {

  CounterCubit(): super(0);


  void increment() {
    emit(state + 1);
  }
}

/// example 1
// void main() {
//   final cubit = CounterCubit(9);
//
//   debugPrint(cubit.state.toString()); // 9
//
//   cubit.increment();
//
//   debugPrint(cubit.state.toString()); // 10
//
//   cubit.close();
// }

/// example 2
// void main() async {
//   final cubit = CounterCubit();
//
//   var subscription1 = cubit.stream.listen(print);
//   var subscription2 = cubit.stream.listen((event) {
//     print("subscription2: $event");
//   });
//
//   cubit.increment();
//
//   // subscription1.cancel();
//   // cubit.close();
// }


/// example 3
class Product {
  String name;
  double cost;

  Product(this.name, this.cost);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}

class Order {
  String time;
  Product product;

  Order(this.time, this.product);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Order &&
          runtimeType == other.runtimeType &&
          product == other.product;

  @override
  int get hashCode => product.hashCode;
}

class Orders {
  String id;
  List<Order> items;

  Orders(this.id, this.items);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Orders && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}

class OrderCubit extends Cubit<Orders> {
  OrderCubit(): super(Orders("01", []));

  void addToCart(Product product) {
    state.items.add(Order(DateTime.now().toString(), product));
    var newState = state;
    emit(newState);
  }

  void removeToCart(Product product) {
    state.items.remove(Order(DateTime.now().toString(), product));
    emit(state);
  }

  @override
  void onChange(Change<Orders> change) {
    super.onChange(change);
    print("currentState: $change");
    print("nextState: ${change.nextState.items.last.product.name}");
  }
}

void main() async {

  Bloc.observer = SimpleBlocObserver();

  OrderCubit orderCubit = OrderCubit();

  orderCubit.addToCart(Product("apple", 12000.0));

  orderCubit.addToCart(Product("shaftoli", 13000.0));

  orderCubit.addToCart(Product("nok", 14000.0));

  await Future.delayed(Duration.zero);
  await orderCubit.close();
}

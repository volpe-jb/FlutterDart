// Used DartPad

import 'dart:async';

class Cake {}

class Order {
  String type;
  
  Order(this.type); //constructor
}

void main() {
  final controller = new StreamController();
  
  final order = new Order ('yellow');
  
  final baker = new StreamTransformer.fromHandlers(
    handleData: (cakeType, sink) {
      if (cakeType == 'chocolate') {
        sink.add(new Cake());
      } else { 
        sink.addError('I cant bake that type!');
      }
    }
  );
    
  controller.sink.add(order);
  
  controller.stream
    .map((order) => order.type)  // extract the type
    .transform(baker) // wire up the baker - add the cake or an error
    .listen(
      (cake) => print('Here is your cake $cake'),
      onError: (err) => print(err),
    );
}
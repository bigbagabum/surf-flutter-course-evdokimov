/*
2. Есть базовый класс Car, с базовыми свойствами для всех машин
 

abstract class Car {

  double weight;

  void run();

}

Есть два наследника Грузовик и Спорткар

 

class Truck extends Car {

  @override

  double get weight => 10;  

  

  @override

  void run() {  }

}

class Sportcar extends Car {

  @override

  double get weight => 2;  

  @override

  void run() {  }

}

 

И есть велосипед

class Bike{}

 

Велосипеды и автомобили являются разными видами транспорта, с различными свойствами. Но, и велосипед и автомобили можно покрасить краской! Необходимо написать миксин, устанавливающий на выбор один из трех цветов для транспортного средства:

Создайте enum Colors с цветами red, green, blue
Создайти миксин Painter с свойством colorName:String и методом setColor(Colors color). В зависимости от значения enum, метод устанавливает название цвета 'red', 'green', 'blue'
Примените миксин к транспортным средствам и инициализируйте покраску в конструкторе класса.
Переопределите метод toString, чтобы он выводил "Грузовик color_name цвета"
Транспортные средства, наследуемые от класса Car приходят в движения от двигателя внутреннего сгорания. На велосипед двигатель установить нельзя.

Напишите миксин, который реализует двигатель только у наследников Car
Задайте свойство enginePower: int  с произвольным значением - мощность двигателя
Напишите функцию runEngine которая выводит строку "Двигатель работает. Максимальная скорость = мощности двигателя / вес автомобиля.
В Truck и SportCar в методе run выполните метод runEngine

*/

//import 'dart:html';

void main() {
  Truck man = Truck(Colors.green, 200);
  Sportcar sc = Sportcar(Colors.red, 150);
  Bike bike = Bike(Colors.blue);

  print(man);
  print(man.runEngine());

  print(sc);
  print(sc.runEngine());
  print(bike);
}

abstract class Car {
  double? weight;

  void run();
}

class Truck extends Car with Painter, Engine {
  @override
  double get weight => 10;

  Truck(Colors c, int e) {
    colorName = c.name;
    enginePower = e;
  }

  @override
  void run() {
    runEngine();
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Грузовик $colorName цвета';
  }
}

class Sportcar extends Car with Painter, Engine {
  @override
  double get weight => 2;

  Sportcar(Colors c, int e) {
    colorName = c.name;
    enginePower = e;
  }

  @override
  void run() {
    runEngine();
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Спорткар $colorName цветв';
  }
}

class Bike with Painter {
  Bike(Colors c) {
    colorName = c.name;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Велосипед $colorName цвета';
  }
}

enum Colors { red, green, blue }

mixin Painter {
  String? colorName;
  setColor(Colors color) {
    colorName = color.name;
  }
}

mixin Engine on Car {
  int? enginePower;

  runEngine() {
    print(
        'Двигатель работает, максимальная скорость ${enginePower! / weight!}');
  }
}

/*
Транспортные средства, наследуемые от класса Car приходят в движения от двигателя внутреннего сгорания. На велосипед двигатель установить нельзя.

Напишите миксин, который реализует двигатель только у наследников Car
Задайте свойство enginePower: int  с произвольным значением - мощность двигателя
Напишите функцию runEngine которая выводит строку "Двигатель работает. Максимальная скорость = мощности двигателя / вес автомобиля.
В Truck и SportCar в методе run выполните метод runEngine
3. Используя обобщения написать класс с методом, приводящим полученное значение в строку.
*/




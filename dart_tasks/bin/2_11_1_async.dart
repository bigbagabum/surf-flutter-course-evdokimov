// Используя Future
// Напишите функцию, которая считывает данные с клавиатуры. Функция должна возвращать Future.
// Напишите код, который дожидается выполнения функции и распечатывает на консоль "Введена строка stroke_name".
// Поэкспериментируйте с async/await и then

import 'dart:convert';
import 'dart:io';

Future<String> readStr() async {
  return Future.value(stdin.readLineSync());
}

void main() async {
  // без async не скомпилирует  var enteredText2 = await readStr();
  print('Введите строку:');

  var enteredText1 = readStr();
  enteredText1.then((value) {
    print('String with THEN: $value');
  });
  await Future.delayed(Duration(seconds: 3), () {
    print('wait please');
  });

  var enteredText2 = await readStr();

  print('Введена строка: ${enteredText2}');
  print('finish');
}

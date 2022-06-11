// Используя Stream
// Напишите функцию, которая считывает данные с клавиатуры до тех пор, пока не будет введен строка "exit". Функция должна возвращать Stream.
// Напишите код, который прослушивает поток и распечатывает на консоль "Введена строка stroke_name" каждый раз, когда в потоке появляется новое событие.

import 'dart:io';

Stream readStr() async* {
  String? str;

  while (str != 'exit') {
    print('Введите строку: ');
    str = stdin.readLineSync();
    print('Введена строка: $str');
  }
  yield str;
}

void main() async {
  readStr().listen((event) {
    print('Вы ввели exit');
  });
}

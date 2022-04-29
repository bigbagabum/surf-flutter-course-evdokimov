import 'dart:io';

void main() {
  /*-- Написать программу, которая слушает ввод в консоли, складывает вводимые пользователем числа. 
 Если пользователь ввел stop, завершить приложение. Если пользователь вводит некорректные данные 
 - прервать текущую итерацию, начать заново. --*/
var x;
var y;

while (x != 'stop' || y != 'stop'){

do {
  print('Введите X:');
  x = stdin.readLineSync();
 } while (int.tryParse(x) == null && x != 'stop');

if (x == 'stop') {
  break;
}


do {
  print('Введите Y:');
  y = stdin.readLineSync();
} while (int.tryParse(y) == null && y != 'stop');
if (y == 'stop') {
  break;
}

  print('Результат X + Y = ${ int.parse(x) + int.parse(y)}');
}

}

/*
Напишите функцию решения квадратного уравнения, используя вложенные функции. 
Вычисление дискриминанта, нахождение x1 и x2 выполните во вложенных функциях. 
Главная функция должна возвращать готовый результат. Функция возвращает ответ в строке (String). 
Есть три вида результата:
Уравнение не имеет решения так как его дискриминант меньше нуля;
Квадратное уравнение имеет единственное решение;
Квадратное уравнение имеет два разных корня.
*/

import 'dart:ffi';
import 'dart:io';

import 'dart:math';

void main() {
  int a, b, c;
  int set_parameter(String par) {
    // считываем корректное целочисленное значение параметра уровнения
    var n;
    do {
      print('Введите значение параметра $par: ');
      n = stdin.readLineSync();
    } while (int.tryParse(n) == null);

    return int.parse(n);
  }

  print('Решаем  квадратное уровнение aX*X + bX + c = 0 ');

  a = set_parameter('a');
  b = set_parameter('b');
  c = set_parameter('c');

  String? gleichung(int a, int b, int c) {
    double diskriminierend(int aa, int bb, int cc) {
      return (bb * bb - 4 * aa * cc).toDouble();
    }

    if (diskriminierend(a, b, c) == 0.0) {
      return (-b / (2 * a)).toString();
    } else {
      if (diskriminierend(a, b, c) < 0.0) {
        return 'нет решения';
      } else {
        String x1, x2;
        x1 = (b * (-1) + sqrt(diskriminierend(a, b, c)) / 2 * a).toString();
        x2 = (b * (-1) - sqrt(diskriminierend(a, b, c)) / 2 * a).toString();
        return 'х1 = ' + x1 + ' x2 = ' + x2;
      }
    }
  }

  print(gleichung(a, b, c));
}

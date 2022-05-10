/* 1)
Создайте текстовую переменную a = ‘hello world’;
Напишите функцию, без возвращаемого значения.
Функция меняет порядок слов на обратный. Например было ‘hello world’,
стало ‘world hello’ 
тут сразу добавил с параметром*/

import 'dart:io';
import 'dart:math';

void main() {
  var a;

  var decision;
  while (decision != 'y') {
    print('Ввести строку? y/n: ');
    decision = stdin.readLineSync();

    if (decision == 'n') {
      a = 'Hello world';
      break;
    } else {
      if (decision == 'y') {
        print('Введите строку для инверсии: ');
        a = stdin.readLineSync();
      }
    }
  }

  void backsort(String str) {
    List mylist = str.split(' ');
    str = '';
    for (int i = mylist.length - 1; i >= 0; i--) {
      str = str + ' ' + mylist[i];
    }
    print(str);
  }

  backsort(a);

  /*
  2) Создайте и проинициализируйте массив чисел с произвольным размером. Напишите функцию,
  которая вычисляет среднее арифметическое число массива и возвращает double результат.
  Распечатайте результат в консоли.
  */

  List<int> listOfInt = [];
  var n = Random();

  for (int m = n.nextInt(10); m >= 0; m--) {
    listOfInt.add(n.nextInt(100));
  }
  print(listOfInt);

  double average(List<int> numbers) {
    double sum = 0;
    numbers.forEach((element) {
      sum = sum + element;
    });

    sum = sum / numbers.length;
    return sum;
  }

  print(average(listOfInt));

  /* Модернизируйте предыдущие функции так, чтобы на вход они принимали необходимые данные для работы.
 Параметр должен быть опциональным.*/

  List<int> listOfInt2 = [];
  var n2;
  var rand = Random();
  var lengthOflist;

  do {
    print('Какой длинны массив сгенерировать? или заполнить рандомно (r):');
    n2 = stdin.readLineSync();
    if (int.tryParse(n2) != null) {
      // проверяем на целочисленное значение
      lengthOflist = int.parse(n2);
    } else {
      if (n2 == 'r') {
        // если пользователь хочет заполнить рандомно генерим рандомную длинну массива
        lengthOflist = rand.nextInt(10);
      }
    }
  } while (int.tryParse(n2) == null && n2 != 'r');

  for (int m = lengthOflist; m >= 1; m--) {
    // заполняем массив
    listOfInt2.add(rand.nextInt(100));
  }

  print(listOfInt2);

  double average2(List<int> numbers) {
    //функция рассчета среднего арифметического
    double sum = 0;
    numbers.forEach((element) {
      sum = sum + element;
    });

    sum = sum / numbers.length;
    return sum;
  }

  print(average2(listOfInt2));
}

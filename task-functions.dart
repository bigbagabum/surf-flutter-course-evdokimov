/* 1) 
Создайте текстовую переменную a = ‘hello world’; 
Напишите функцию, без возвращаемого значения. 
Функция меняет порядок слов на обратный. Например было ‘hello world’, 
стало ‘world hello’ */

import 'dart:math';

void main() {
  String a = 'hello world';
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
}

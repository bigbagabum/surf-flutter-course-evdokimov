// ignore_for_file: unused_local_variable

int a = 1; // 2.4.1 Создать глобальную переменную типа int с именем a

void main() {
  double b = 1.0; //2.4.2 Создать локальную переменную типа double с именем b

  //2.4.3 Создать строковую переменную с именем text  при помощи var, попытаться присвоить переменной a. Каков результат?
  var text = 'hello';
  text = a
      as String; //не соответствует тип, можно это победить преобразовав A в string

  //2.4.4 Создать переменную  с именем dyn при помощи dynamic, проинициализировать его целочисленным значением, далее попытаться присвоить переменной строковое значение переменной text. Каков результат? Почему?
  dynamic dyn = 10;
  dyn =
      text; // т.к. dinamic отключает проверку типа но значение уже int то в int нельзя записать string просто так

  //2.4.5 Создать переменную с именем fin  при помощи final и con при помощи const, попытаться изменить переменные, посмотреть результат. В чем отличия final от const?
  final int fin;
  const int con = 1;

  con = con + 1; // нельзя менять при выполнении программы
  fin =
      5; // Final переменной можно присвоить значение только один раз, например при инициализации если задать пустое то можно вычислить по ходу работы программы в отличие от const которой значение нужно присвоить сразу при инииализации

  //2.4.6 Создать числовую переменную с именем a проверить является ли число четным
  if (a.isEven) {
    print('переменная a четная');
  } else {
    print('переменная а нечетная');
  }

  //2.4.7 Используете 32-битный символ Unicode u2665 выведите сообщение  в консоль: I ♥ dart
  var heart = '\u2665';
  print('I ' + heart + " dart");

  /* 2.4.8 Выполните задания:
1. Создать список var list = [1,2,3,4,5,6,7,8] 
2. Вывести длину этого списка.
3. Вывести отсортированный список list в порядке убывания, используя sort.
4. Вывести выделить подсписок newList  длиной в 3 элемента.
5. Вывести индекс элемента со значением “5” в списке list.
6. Удалить значения с 5 до 8 из списка list при помощи removeWhere и вывести в консоль.
7. Заменить массив значениями [1,2,3] в списке list на [10, 20, 30] и вывести в консоль.
*/
  // 1
  var list = [1, 2, 3, 4, 5, 6, 7, 8];

  // 2
  print(list.length);

  //3
  list.sort(((c, d) => d.compareTo(c)));
  print(list);

// 4
  var newList = list.sublist(0, 3);
  print(newList);

// 5
  print(list.indexOf(5));

// 6
  list.removeWhere((element) => element >= 5 && element <= 8);
  print(list);

// 7
  for (int i = 0; i < 3; i++) {
    list[i] = list[i] * 10;
  }
  print(list);

/* 2.4.9 
  Выполните задания:
1) Создать Map телефонных номеров с именем numberBook  и типом данных (“имя”: “номер телефона”), заполнить данными: Иван : 2264865, Татьяна: 89523366684, Олег: 84952256575.
2) Вывести на экран весь телефонный справочник numberBook.
3) Вставить новый номер в карту: Екатерина:2359942 
4) Отсортировать карту в обратном порядке по ключам и вывести на экран результат.
  */

// 1
  var numberBook = {
    "Иван": "2264865",
    "Татьяна": "89523366684",
    "Олег": "84952256575"
  };

// 2
  print(numberBook);

// 3
  numberBook.addAll({"Екатерина": "2359942"});

// 4
  var faceBook = numberBook.entries.toList();
  faceBook.sort((a, b) => b.key.compareTo(a.key)); //сортируем список
  numberBook.clear();

  for (int i = 0; i < faceBook.length; i++) {
    // переводим список в map
    numberBook.addAll({faceBook.elementAt(i).key: faceBook.elementAt(i).value});
  }
  print(numberBook);

/* 2.4.10
Set
Создать Set строк с именем mySet и данными {‘Москва’, ‘Вашингтон’, ‘Париж’}
Добавить в mySet  еще одно значение ‘Вашингтон’. Вывести длину списка(комментарием написать почему длина именно такая)
Вывести на экран количество уникальных слов в тексте c учетом регистра(She == she)
“She sells sea shells on the sea shore

The shells that she sells are sea shells I am sure.

So if she sells sea shells on the sea shore

I am sure that the shells are sea shore shells”
*/
//
  var mySet = {'Москва', 'Вашингтон', 'Париж'};
  mySet.add('Вашингтон');
  print(
      mySet.length); // длинна не увеличилась, потому что значение не уникально
//

  String mystring = '''She sells sea shells on the sea shore 
The shells that she sells are sea shells I am sure.
So if she sells sea shells on the sea shore
I am sure that the shells are sea shore shells''';

  mystring = mystring.toLowerCase(); //Убираем верхний регистр

  mystring = mystring.replaceAll('\n', ' '); // заменяем все переносы на пробелы
  List<String> mylist =
      mystring.split(' '); // разбиваем строку в список слов с разделителем ' '

  /* mylist = mylist
      .where((element) => element.contains('sh'))
      .toList(); //собираем список из списка со словами с 'sh' */
  var mySet1 = mylist.toSet();

  print(mySet1);
  print(mySet1.length);
}

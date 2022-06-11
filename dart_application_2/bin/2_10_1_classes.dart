/*
1. Реализуйте класс Student (Студент), который будет наследоваться от класса User. 
Класс должен иметь следующие свойства:

yearOfAdmission:DateTime (год поступления в вуз): инициализируется в конструкторе
currentCourse:int (текущий курс): рассчитывается след. образом - из текущего года вычесть год поступления. чтобы получить годы из DateTime, воспользуйтесь свойством DateTime.year
Класс должен иметь метод toString() , с помощью которого можно вывести:

имя и фамилию студента - используя родительскую реализацию toString
год поступления
текущий курс */

void main() {
  Student tom =
      Student(yearOfAdmission: DateTime(2019, 12, 11), f: '1', l: '2');

  print(tom.toString());
}

class User {
  final String firstname;
  final String lastname;

  User({required this.firstname, required this.lastname});

  @override
  String toString() {
    return '$firstname $lastname';
  }
}

class Student extends User {
  final DateTime yearOfAdmission;

  Student({required this.yearOfAdmission, required String f, required String l})
      : super(firstname: f, lastname: l);

  int get currentCourse => DateTime.now().year - yearOfAdmission.year;

  @override
  String toString() {
    return '''
     Der Name des Schülers ist ${super.toString()}
     Jahr der Zulassung ${yearOfAdmission.year}
     aktueller Wechselkurs $currentCourse
  ''';
  }
}

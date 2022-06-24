// 3. Используя обобщения написать класс с методом,
// приводящим полученное значение в строку.

class MyClass<T> {
  String method(T value) {
    return value.toString();
  }
}

main() {
  var myClass = MyClass();
  print(myClass.method("Hallo wie gehts es ?"));
}

class Car{
  String name;
  int yearOfProduction;

  Car({this.name, this.yearOfProduction});

  @override
  String toString() {
    return '$name - $yearOfProduction';
  }
  void dosomething(){
    print("ở đây nè !!");
  }

  void sayHello({String name}){
    print('Hello $name');
  }
}
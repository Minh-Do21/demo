import 'package:flutter/material.dart';
import 'package:myapp/car.dart';
import 'calculation.dart';
import 'MyApp.dart';
import 'MyApp2.dart';
import 'LayOutDemo.dart';
void main(){
  // for(int i = 0; i < number.length; i++){
  //   print(number[i]);
  // }

  // number.forEach((element) {
  //   print(element);
  // });
  // listString.forEach((element) {
  //   print(element);
  // });

  // var myCar = Car("Mercedes", 2020);
  // myCar.dosomething();
  // myCar.sayHello(name: "Hà Thu");

  //list car cách 1
  // List<Car> carList = <Car>[];
  // carList.add(Car(name: "Mec 300", yearOfProduction: 2018));
  // carList.add(Car(name: "Mec s500", yearOfProduction: 2015));
  // carList.add(Car(name: "Mec c250", yearOfProduction: 2019));

  //list car cách 2
  List<Car> carList = <Car>[
      Car(name: "Mec 300", yearOfProduction: 2018),
      Car(name: "Mec s500", yearOfProduction: 2015),
      Car(name: "Mec c250", yearOfProduction: 2019),
      Car(name: "Mec c50", yearOfProduction: 2014)
  ];

  // carList.forEach((element) {
  //   print(element);
  // });

  //sắp xếp list
  //tăng theo giá trị số
  // carList.sort((car1, car2) => car1.yearOfProduction - car2.yearOfProduction);
  //giảm theo giá trị số
  // carList.sort((car1, car2) => car2.yearOfProduction - car1.yearOfProduction);
  //sắp xếp theo A->Z
  carList.sort((car1, car2) => car1.name.compareTo(car2.name));

  //update
  carList[0].yearOfProduction = 2017;

  //filter || where
  var filterCarList = carList.where((car) => car.yearOfProduction >= 2015
    && car.name.toUpperCase().contains("00")).toList();

  //delete
  carList = carList.where((car) => car.name != "Mec 300").toList();

  //lấy ra nguyên tên bằng map
  List<String> carListName = carList.map((car) => car.name).toList();

  runApp(
      //Demo Layout
      MaterialApp(
        title: 'Transaction app',
        theme: ThemeData(
          primaryColor: Colors.green[800],
          accentColor: Colors.red[500]
        ),
        home: LayOutDemo(),
      )

      //Demo
      // MyApp()

      //Demo
      // MyApp2(name:'Minh Đô', age: 20)
      // Center(child: Text(carListName.toString(),
      //   style: TextStyle(fontSize: 20),
      //   textDirection: TextDirection.ltr,
      // )),
  );
}
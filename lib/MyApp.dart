import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  @override
  Widget build(BuildContext context) {

    //now datetime
    DateTime now = new DateTime.now();
    DateTime someDate = new DateTime(2000, 09, 17);

    return MaterialApp(
      title: "this is a StatefulWidget",
      home: Scaffold(
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(
              now.toString(),
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
              Text(
                //fomat time
                // DateFormat('yyyy/MM/dd').format(someDate)
                // DateFormat.yMMMd().format(now)
                NumberFormat('###.0#', 'en_US').format(12.345678)
                ,
                style: TextStyle(fontSize: 30, color: Colors.green),
              ),
          ],)
        ),
      ),
    );
  }

}
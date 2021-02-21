import 'package:flutter/material.dart';
class MyApp2 extends StatefulWidget{
  String name;
  int age;

  MyApp2({this.name, this.age});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp2> with WidgetsBindingObserver{
  String _email = ""; //this is state
  final emailEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print('Run initState');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailEditingController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print('Run dispose');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused){
      print("App is in Background mode");
    }else if(state == AppLifecycleState.resumed){
      print("App is in Foreground mode");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('Run build');
    return MaterialApp(
      title: "this is a StatefulWidget",
      home: Scaffold(
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: emailEditingController,
                onChanged: (text){
                  this.setState(() {
                    _email = text;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5)
                      ),
                    ),
                    labelText: 'Enter your email'
                ),
              ),
            ),
            Text(
              _email,
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
            Text(
              'this is two',
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
              Text(
                'this is three',
                style: TextStyle(fontSize: 30, color: Colors.green),
              ),
          ],)
        ),
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'TransactionList.dart';
import 'transaction.dart';

class LayOutDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<LayOutDemo> with WidgetsBindingObserver{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  //state
  Transaction _transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = List<Transaction>();

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

  void _insertTransaction(){
    if(_transaction.content.isEmpty || _transaction.amount == 0 || _transaction.amount.isNaN){
      return;
    }
    _transaction.createDate = DateTime.now();
    _transactions.add(_transaction);
    _transaction = Transaction(content: "", amount: 0.0);
    _contentController.text = '';
    _amountController.text = '';
  }

  void _onButtonShowModalSheet(){
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        builder: (context){
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: "Content"),
                  controller: _contentController,
                  onChanged: (text){
                    setState(() {
                      _transaction.content = text;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: "Amount(money)"),
                  controller: _amountController,
                  onChanged: (text){
                    setState(() {
                      _transaction.amount = double.tryParse(text) ?? 0;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    // ignore: deprecated_member_use
                    Expanded(child: SizedBox(child: RaisedButton(
                        color: Colors.green,
                        child: Text("Save", style: TextStyle(fontSize: 16, color: Colors.white),),
                        onPressed: (){
                          print("press Save");
                          setState(() {
                            this._insertTransaction();
                          });
                          Navigator.of(context).pop();
                        }
                    ), height: 40,)),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    // ignore: deprecated_member_use
                    Expanded(child: SizedBox(child: RaisedButton(
                        color: Colors.pink,
                        child: Text("Canel", style: TextStyle(fontSize: 16, color: Colors.white),),
                        onPressed: (){
                          print("press Canel");
                          Navigator.of(context).pop();
                        }
                    ),height: 40,)),
                  ],
                ),
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trasaction manager"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              this._onButtonShowModalSheet();
              // setState(() {
              //   this._insertTransaction();
              // });
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add transaction',
        child: Icon(Icons.add),
        onPressed: (){
          this._onButtonShowModalSheet();
          // setState(() {
          //   this._insertTransaction();
          // });
        },
        backgroundColor: Theme.of(context).primaryColor,
      ),
      key: _scaffoldKey,
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              ButtonTheme(
                height: 45,
                child:  FlatButton(
                  child: Text("Insert Transaction", style: const TextStyle(fontSize: 16, fontFamily: 'IndieFlower'),),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed: (){
                    // print("Conten = $_content || money = $_amount");
                    this._onButtonShowModalSheet();

                    //Display giao diện người dùng
                    // _scaffoldKey.currentState.showSnackBar(
                    //     SnackBar(
                    //       content: Text('Transaction List: '+_transactions.toString()),
                    //       duration: Duration(seconds: 3),
                    //     )
                    // );
                  },
                ),
              ),
              TransactionList(transactions: _transactions,)
            ],),
        ),
      ),
    );
  }

}
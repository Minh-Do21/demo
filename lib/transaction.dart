import 'package:flutter/material.dart';
class Transaction{
  String content;
  double amount;
  DateTime createDate;

  //hàm khởi tạo
  Transaction({this.content, this.amount, this.createDate});

  @override
  String toString() {
    // TODO: implement toString
    return 'content:  $content, amount: $amount';
  }
}
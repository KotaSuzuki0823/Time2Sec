import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberFormField extends TextFormField {
  final _formKey = GlobalKey<FormState>();
  final String title;

  NumberFormField(
      BuildContext context, {Key? key, required this.title})
      : super(key: key,
        decoration: InputDecoration(
          labelText: title, // ラベル
          hintText: 'Enter ' + title + ' here.', // 入力ヒント
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) { // _formKey.currentState.validate()でコールされる
          if (value!.isEmpty) {
            return 'Please enter some number.'; // エラー表示のメッセージを返す
          }
          return null; // 問題ない場合はnullを返す
        },
        onSaved: (value) => () { // this._formKey.currentState.save()でコールされる
          print('$value');
        },
      );
}


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: title, // ラベル
          hintText: 'Enter your email', // 入力ヒント
        ),
        autovalidateMode: true, // 入力変化しても自動でチェックしない。trueにすると初期状態および入力が変化する毎に自動でvalidatorがコールされる
        validator: (value) { // _formKey.currentState.validate()でコールされる
          if (value.isEmpty) {
            return 'Please enter some text'; // エラー表示のメッセージを返す
          }
          return null; // 問題ない場合はnullを返す
        },
        onSaved: (value) => () { // this._formKey.currentState.save()でコールされる
          print('$value');
        },
      ),
    );
  }
}
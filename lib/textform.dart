import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberFormField extends Row {
  final _formKey = GlobalKey<FormState>();
  final String title;

  NumberFormField(BuildContext context, {Key? key, required this.title})
      : super(key: key,
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: TextFormField(
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
              ),
            ),
            Expanded(
                flex: 1,
                child: Text(title)
            ),
          ],
    ); // super
}

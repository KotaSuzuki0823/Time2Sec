import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time2Sec',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.redAccent,
      )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// MyHomePageクラスから継承
class _MyHomePageState extends State<MyHomePage> {
  final _hourController = TextEditingController();
  final _minController = TextEditingController();
  final _secController = TextEditingController();

  final _hourKey = GlobalKey<FormFieldState<String>>();
  final _minKey = GlobalKey<FormFieldState<String>>();
  final _secKey = GlobalKey<FormFieldState<String>>();

  int _result = 0;

  /*時間から秒に変換して_resultに渡す*/
  void _calcTimeToSec({required int hour, required int min, required int sec}) {
    setState(() {
      //calc
      _result = (hour * 3600) + (min * 60) + sec;
      print('_result : ' + _result.toString());
    });
  }

  /*全フィールドのクリア*/
  void _clearField() {
    setState(() {
      _hourController.clear();
      _minController.clear();
      _secController.clear();
    });
  }

  /*時間入力フォームの単品ウィジェット*/
  Widget _numberFormField({required String title, Key? key}) {
    //final _formKey = GlobalKey<FormFieldState<String>>();
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            key: key,
            decoration: InputDecoration(
              labelText: title, // ラベル
              hintText: 'Enter ' + title + ' here.', // 入力ヒント
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              // _formKey.currentState.validate()でコールされる
              if (value!.isEmpty) {
                return 'Please enter some number.'; // エラー表示のメッセージを返す
              }
              //formValue = value;
              return null; // 問題ない場合はnullを返す
            },
            onSaved: (value) => () {
              // this._formKey.currentState.save()でコールされる
              debugPrint('$value');
            },
          ),
        ),
        Expanded(flex: 1, child: Text(title)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _hour = _numberFormField(title: 'hour', key: _hourKey);
    Widget _min = _numberFormField(title: 'min', key: _minKey);
    Widget _sec = _numberFormField(title: 'sec', key: _secKey);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Time to second'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: _hour,
                ),
                Expanded(
                  flex: 1,
                  child: _min,
                ),
                Expanded(
                  flex: 1,
                  child: _sec,
                ),
              ],
            ),
            Container(
              height: 50,
            ),
            ElevatedButton(
              child: const Text('Clear'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _clearField,
            ),
            Container(
              height: 50,
            ),
            Text(
              '$_result',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Calc time',
        onPressed: () => {
          debugPrint("FABをクリック"),
          _calcTimeToSec(
            hour: int.parse(_hourKey.currentState!.value ?? '0'),
            min: int.parse(_minKey.currentState!.value ?? '0'),
            sec: int.parse(_secKey.currentState!.value ?? '0'),
          ),
        },
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

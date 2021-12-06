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
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //const MyHomePage({Key? key, required this.title}) : super(key: key);
  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // getter method
  get _hourController => TextEditingController();
  get _minController => TextEditingController();
  get _secController => TextEditingController();

  int _result = 0;

  void _calcTimeToSec() {
    setState(() {
      //計算
      _result = (int.parse(_hourController.text) * 3600) + (int.parse(_minController.text) * 60) + int.parse(_secController.text);
    });
  }

  void _clearField(){
    setState(() {
      _hourController.clear();
      _minController.clear();
      _secController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _hourController,
                  ),
                ),
                const Text(
                  'Hour'
                ),
                Expanded(
                child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _minController,
                  ),
                ),
                const Text(
                    'min'
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _secController,
                  ),
                ),
                const Text(
                    'sec'
                ),
              ],
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

            Text(
              '$_result',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calcTimeToSec,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

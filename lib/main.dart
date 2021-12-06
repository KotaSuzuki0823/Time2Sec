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

// MyHomePageクラスから継承
class _MyHomePageState extends State<MyHomePage> {
  // getter method
  final _hourController = TextEditingController();
  final _minController = TextEditingController();
  final _secController = TextEditingController();

  int _result = 0;

  void _calcTimeToSec({required int hour, required int min, required int sec}) {
    setState(() {
      //int _hour = int.parse(_hourController.text);
      //int _min = int.parse(_minController.text);
      //int _sec = int.parse(_secController.text);

      //calc
      _result = (hour * 3600) + (min * 60) + sec;
      print('_result : ' + _result.toString());
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
                  flex: 1,
                  child: Container(
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _hourController,
                  ),
                ),
                const Text(
                  'hour'
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                  ),
                ),
                Expanded(
                  flex: 2,
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
                  flex: 1,
                  child: Container(
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _secController,
                  ),
                ),
                const Text(
                    'sec'
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                  ),
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
          print("フローティングアクションボタンをクリック"),
          _calcTimeToSec(
              hour: int.parse(_hourController.text),
              min: int.parse(_minController.text),
              sec: int.parse(_secController.text),
          ),
        },
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



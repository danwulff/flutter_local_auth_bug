import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final localAuth = LocalAuthentication();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _canCheckBiometricsResult;

  void _checkBiometrics() async {
    final result = await widget.localAuth.canCheckBiometrics;

    setState(() {
      _canCheckBiometricsResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('local_auth bug'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'The result of canCheckBiometrics:',
            ),
            Text(
              '${_canCheckBiometricsResult ?? ''}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _checkBiometrics,
        tooltip: 'Increment',
        child: Icon(Icons.update),
      ),
    );
  }
}

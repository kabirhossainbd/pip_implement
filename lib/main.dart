import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pip_view/pip_example.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const First(),
    );
  }
}

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('First Page'),
            InkWell(
                onTap: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (_)=> PipExample()));
                },
                child: Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}


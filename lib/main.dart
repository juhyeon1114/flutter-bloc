import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

final counterBloc = CounterBloc();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyStatefulWidget()
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sample')),
      body: Center(
        child: StreamBuilder<int>(
          stream: counterBloc.count$, // 어디로부터 stream을 받아올 건지 
          builder: (context, snapshot) { // 받아온 스트림을 어떻게 처리할 건지
            if (snapshot.hasData) {
              return Text('${snapshot.data}', style: TextStyle(fontSize: 80),);
            } else {
              return CircularProgressIndicator();
            }
          },
        )
      ),
      bottomNavigationBar: BottomAppBar(child: Container(height: 50,),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.addCount();
        },
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
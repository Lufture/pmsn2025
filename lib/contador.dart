import 'package:flutter/material.dart';
import 'package:pmsn2025/colors_app.dart';

void main() => runApp( MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Container(
          child: Center( child: Text('Contador $contador'  , style: TextStyle(fontSize: 25,fontFamily: 'Vanilla',color: ColorsApp.txtColor ),)),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ads_click),
          onPressed:(){
          contador++;
          print(contador);
          setState(() {
            
          });
        } ,
      ),
    )
    );
  }

  miEvento(){}
}
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mi_proyecto_asincrono/services/mockapi.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int carritomensaje = 0;
  double carroancho = 0;
  int carrosegundos = 0;
  int carro = 0;

  int humanomensaje = 0;
  double humanoancho = 0;
  int humanosegundos = 0;
  int humano = 0;

  int rayitomensaje = 0;
  double rayoancho = 0;
  int rayosegundos = 0;
  int rayo = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Actuacion Asincronica',
      home: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          title: const Text(
            "Jean Casquete 7mo A",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xFF4FC3F7),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  FloatingActionButton(
                    onPressed: () async {
                      setState(() {
                        rayoancho = 200;
                        rayosegundos = 1;
                      });
                      rayo = await MockApi().getFerrariInteger();
                      setState(() {
                        rayitomensaje = rayo;
                        rayoancho = 0;
                        rayosegundos = 0;
                      });
                    },
                    backgroundColor: Color.fromARGB(255, 41, 141, 56),
                    child: const Icon(
                      Icons.flash_on,
                      color: Colors.black,
                    ),
                  ),
                  AnimatedContainer(
                    width: rayoancho,
                    height: 15,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 41, 141, 56)),
                    duration: Duration(seconds: rayosegundos),
                  ),
                  Text(
                    rayitomensaje.toInt().toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 41, 141, 56),
                        fontSize: 25.0),
                  ),
                ],
              ),
              Column(
                children: [
                  FloatingActionButton(
                      onPressed: () async {
                        setState(() {
                          carroancho = 200;
                          carrosegundos = 3;
                        });
                        carro = await MockApi().getHyundaiInteger();
                        setState(() {
                          carritomensaje = carro;
                          carroancho = 0;
                          carrosegundos = 0;
                        });
                      },
                      backgroundColor: Colors.blue,
                      child: const Icon(
                        Icons.airport_shuttle,
                        color: Colors.black,
                      )),
                  AnimatedContainer(
                    width: carroancho,
                    height: 15,
                    decoration: const BoxDecoration(color: Colors.blue),
                    duration: Duration(seconds: carrosegundos),
                  ),
                  Text(
                    carritomensaje.toInt().toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 25.0),
                  )
                ],
              ),
              Column(
                children: [
                  FloatingActionButton(
                      onPressed: () async {
                        setState(() {
                          humanoancho = 200;
                          humanosegundos = 10;
                        });
                        humano = await MockApi().getFisherPriceInteger();
                        setState(() {
                          humanomensaje = humano;
                          humanoancho = 0;
                          humanosegundos = 0;
                        });
                      },
                      backgroundColor: Color.fromARGB(255, 255, 59, 111),
                      child: const Icon(
                        Icons.directions_walk,
                        color: Colors.black,
                      )),
                  AnimatedContainer(
                    width: humanoancho,
                    height: 15,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 59, 111)),
                    duration: Duration(seconds: humanosegundos),
                  ),
                  Text(humanomensaje.toInt().toString(),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 59, 111),
                          fontSize: 25.0))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

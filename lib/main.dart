import 'package:flutter/material.dart';
import 'dart:math';
import 'package:async/async.dart';


void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final celsiusController = TextEditingController();
  final farenheitController = TextEditingController();
  final kelvinController = TextEditingController();

  double celsius;
  double farenheit;
  double kelvin;

  double resulCelsius;
  double resulKelvin;

  void resetInform (){
    setState(() {
      celsiusController.text = "";
      farenheitController.text = "";
      kelvinController.text = "";
    });
  }


void changeCelsius (String text){
  this.celsius = double.parse(text);//transformando o text em double
  resulCelsius = celsius * 1.8; // efetuando a conversão de celsius a farenheit
  farenheitController.text = (resulCelsius + 32).toStringAsFixed(2); // dizendo para no text do farenheit aparecer ja o resultado
  kelvinController.text = (celsius + 273).toStringAsFixed(2); // o msm no kelvin

}

void changeFarenheit(String text){
  this.farenheit = double.parse(text);
  celsiusController.text = ((farenheit - 32) / 1.8).toStringAsFixed(2);
  kelvinController.text = ((farenheit-32)* (5/9)+273.15).toStringAsFixed(2);
}

void changeKelvin(String text){
  this.kelvin = double.parse(text);
  celsiusController.text = (kelvin - 273.15).toStringAsFixed(2);
  farenheitController.text = ((kelvin - 273.15) * (9/5)+32).toStringAsFixed(2);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Temperatura'),
        centerTitle: true,
      ),
      body: 
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 30, 5, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                child: Image.asset("images/temperaturas.png"),
              ),
              TextFormField(
                controller: celsiusController,
                decoration: InputDecoration(
                  labelText: 'Celsius',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: changeCelsius,
                keyboardType: TextInputType.number,
              ),
              Divider(),
              TextFormField(
                controller: farenheitController,
                decoration: InputDecoration(
                  labelText: 'Farenheit',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: changeFarenheit,
                keyboardType: TextInputType.number,
              ),
              Divider(),
              TextFormField(
                controller: kelvinController,// recebe o valor digitado
                decoration: InputDecoration(
                  labelText: 'Kelvin',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent
                  ),
                  border: OutlineInputBorder(),// cria uma borda no text form  field
                ),
                onChanged: changeKelvin,
                keyboardType: TextInputType.number, // só abre a função no cel para se digitar numeros
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(onPressed: resetInform,
                      child: Icon(Icons.refresh),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

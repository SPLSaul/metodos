import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Selecciona el metodo:'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Expanded(
                child: Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NewtonRaphsonNormal()),
                      );
                    },
                    child: Text("Newton Raphson Normal"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NewtonRaphsonMejorado()),
                      );
                    },
                    child: Text("Newton Raphson Mejorado"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class NewtonRaphsonNormal extends StatefulWidget {
  @override
  _NewtonRaphsonNormalState createState() => _NewtonRaphsonNormalState();
}

class _NewtonRaphsonNormalState extends State<NewtonRaphsonNormal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newton Raphson Normal'),
      ),
      body: Center(
        child: Text('Newton Raphson Normal'),
      ),
    );
  }
}

class NewtonRaphsonMejorado extends StatefulWidget {
  @override
  _NewtonRaphsonMejoradoState createState() => _NewtonRaphsonMejoradoState();
}

class _NewtonRaphsonMejoradoState extends State<NewtonRaphsonMejorado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newton Raphson Mejorado'),
      ),
      body: Center(
        child: Text('Newton Raphson Mejorado'),
      ),
    );
  }
}
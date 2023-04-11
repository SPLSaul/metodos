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
                    child: Text("Newton Raphson Normal",style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor * 50,color: Colors.deepPurple.shade900,fontWeight: FontWeight.bold),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.limeAccent.shade100),
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
                    child: Text("Newton Raphson Mejorado",style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor * 50,color: Colors.deepPurple.shade900,fontWeight: FontWeight.bold ),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.tealAccent.shade100),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10), // Espacio en blanco para separar del borde superior
            TextField(
              decoration: InputDecoration(hintText: 'Introduce la función: '),
            ),
          ],
        ),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10), // Espacio en blanco para separar del borde superior
            TextField(
              decoration: InputDecoration(hintText: 'Introduce la función: '),
            ),
          ],
        ),
      ),
    );
  }
}
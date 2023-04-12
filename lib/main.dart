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
        body: SingleChildScrollView(
          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Builder(
                  builder: (context) => Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => NewtonRaphsonNormal()),
                        );
                      },
                      child: Text(
                        "Newton Raphson Normal",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).textScaleFactor * 40,
                            color: Colors.deepPurple.shade900,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.limeAccent.shade100),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Builder(
                  builder: (context) => Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => NewtonRaphsonMejorado()),
                        );
                      },
                      child: Text(
                        "Newton Raphson Mejorado",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).textScaleFactor * 40,
                            color: Colors.deepPurple.shade900,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.tealAccent.shade100),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Builder(
                  builder: (context) => Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Ejemplo()),
                        );
                      },
                      child: Text(
                        "Ejemplos",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).textScaleFactor * 40,
                            color: Colors.deepPurple.shade900,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
              onChanged: (text){},
            ),
            TextField(decoration: InputDecoration(hintText: 'Introduce la funcion derivada'),onChanged: (text){},),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Valor inicial de x:',
                    ),
                    onChanged: (text) {},
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Error a encontrar:',
                    ),
                    onChanged: (text) {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Presionado'),),);
              },
              child: Text('Calcular',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
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
              onChanged: (text){},
            ),
            TextField(decoration: InputDecoration(hintText: 'Introduce la funcion derivada: '), onChanged: (text){},),
            TextField(decoration: InputDecoration(hintText: 'Introduce la segunda derivada de la funcion: '), onChanged: (text){},),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Valor inicial de x:',
                    ),
                    onChanged: (text) {},
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Error a encontrar:',
                    ),
                    onChanged: (text) {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Presionado'),),);
              },
              child: Text('Calcular',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
            ),
          ],
        ),
      ),
    );
  }
}

class Ejemplo extends StatelessWidget{
  @override
  Widget build(BuildContext buildContext){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Selecciona el ejemplo'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(buildContext).pop(),
          ),
        ),
      ),
    );
  }
}

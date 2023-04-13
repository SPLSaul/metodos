import 'package:flutter/material.dart';
import 'dart:math';

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
                            MaterialPageRoute(
                                builder: (context) => NewtonRaphsonNormal()),
                          );
                        },
                        child: Text(
                          "Newton Raphson Normal",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 40,
                              color: Colors.deepPurple.shade900,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.limeAccent.shade100),
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
                            MaterialPageRoute(
                                builder: (context) => NewtonRaphsonMejorado()),
                          );
                        },
                        child: Text(
                          "Newton Raphson Mejorado",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 40,
                              color: Colors.deepPurple.shade900,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.tealAccent.shade100),
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
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 40,
                              color: Colors.deepPurple.shade900,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepOrange),
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
  final formKey = new GlobalKey<FormState>();
  var funcion_Controller = new TextEditingController();
  var funcionDerivada_Controller = new TextEditingController();
  var xInicial_Controller = new TextEditingController();
  var errorEncontrar_Controller = new TextEditingController();
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
            SizedBox(
                height:
                    10), // Espacio en blanco para separar del borde superior
            TextField(
              decoration: InputDecoration(hintText: 'Introduce la función: '),
              onChanged: (text) {},
            ),
            TextField(
              decoration:
                  InputDecoration(hintText: 'Introduce la funcion derivada'),
              onChanged: (text) {},
            ),
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
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Presionado'),
                  ),
                );
              },
              child: Text(
                'Calcular',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Iteracion')),
                DataColumn(label: Text('x')),
                DataColumn(label: Text('Error')),
              ],
              rows: _rows,
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
  final formKey = new GlobalKey<FormState>();
  var funcion_Controller = new TextEditingController();
  var funcionDerivada_Controller = new TextEditingController();
  var funcionSegundaDerivada_Controller = new TextEditingController();
  var xInicial_Controller = new TextEditingController();
  var errorEncontrar_Controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Newton Raphson Mejorado'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: formKey, // referencia a la clave global del formulario
            autovalidateMode: AutovalidateMode.always, // activa la validación automática
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height:
                    10), // Espacio en blanco para separar del borde superior
                TextFormField(
                  decoration: InputDecoration(hintText: 'Introduce la función: '),
                  controller: funcion_Controller,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Por favor, ingresa la función';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                  InputDecoration(hintText: 'Introduce la funcion derivada: '),
                  controller: funcionDerivada_Controller,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Por favor, ingresa la función';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Introduce la segunda derivada de la funcion: '),
                  controller: funcionSegundaDerivada_Controller,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Por favor, ingresa la función';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Valor inicial de x:',
                        ),
                        controller: xInicial_Controller,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Por favor, ingresa un valor';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Error a encontrar:',
                        ),
                        controller: errorEncontrar_Controller,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Por favor, ingresa un valor';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Presionado'),
                      ),
                    );
                  },
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                ),
                DataTable(
                  columns: [
                    DataColumn(label: Text('Iteracion')),
                    DataColumn(label: Text('x')),
                    DataColumn(label: Text('Error')),
                  ],
                  rows: _rows,
                ),
              ],
            ),
          ),
        ));
  }
}

List<DataRow> _rows = createDataRowList(iteraciones, xitabla, errorestabla);

List<DataRow> createDataRowList(
    List<int> iteraciones, List<double> xitabla, List<double> errorestabla) {
  return iteraciones.map((iteracion) {
    int index = iteraciones.indexOf(iteracion);
    return DataRow(cells: [
      DataCell(Text(iteracion.toString())),
      DataCell(Text(xitabla[index].toString())),
      DataCell(Text(errorestabla[index].toString())),
    ]);
  }).toList();
}

class Ejemplo extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
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

MetodosNewtonNormal metodos = new MetodosNewtonNormal();
List<dynamic> resultados = metodos.problema1([], [], []);
List<double> errorestabla = resultados[0];
List<int> iteraciones = resultados[1];
List<double> xitabla = resultados[2];

class MetodosNewtonNormal {
  List<dynamic> problema1(
      List<int> iteraciones, List<double> xitabla, List<double> errorestabla) {
    //Newton Raphson normal
    iteraciones.clear();
    xitabla.clear();
    errorestabla.clear();
    List<double> xi = [0];
    int x = 0;
    double errorP = 99;
    while (errorP > 1) {
      double fxi = pow(xi[x], 4) -
          6 * pow(xi[x], 3) +
          12 * pow(xi[x], 2) -
          10 * xi[x] +
          3;
      double dfxi = 4 * pow(xi[x], 3) - 18 * pow(xi[x], 2) + 24 * xi[x] - 10;
      double ecuacionNR = xi[x] - fxi / dfxi;
      xi.add((ecuacionNR * 100000).roundToDouble() / 100000);
      errorP = ((xi[x + 1] - xi[x]) / xi[x + 1]).abs() * 100;
      errorestabla.add((errorP * 100000).roundToDouble() / 100000);
      iteraciones.add(x);
      xitabla.add(xi[x]);
      x++;
    }
    return [errorestabla, iteraciones, xitabla];
  }
}

class MetodoMejorado {
  List<dynamic> problema2(List<int> iteraciones, List<double> xitabla,
      List<double> errorestabla, double xi, double error) {
    iteraciones.clear();
    xitabla.clear();
    errorestabla.clear();
    int iteracionesX = 0;
    double fxi, dfxi, ddfxi, xn, errorPorcentual;
    do {
      fxi = pow(xi, 4) - 6 * pow(xi, 3) + 12 * pow(xi, 2) - 10 * xi + 3;
      dfxi = 4 * pow(xi, 3) - 18 * pow(xi, 2) + 24 * xi - 10;
      ddfxi = 12 * pow(xi, 2) - 36 * xi + 24;
      xn = xi - ((fxi * dfxi) / ((pow(dfxi, 2)) - (fxi * ddfxi)));
      errorPorcentual = ((xn - xi) / xn).abs() * 100;
      xi = xn;
      xitabla.add(xi);
      errorestabla.add(errorPorcentual);
      iteraciones.add(iteracionesX);
      iteracionesX++;
    } while (errorPorcentual > error || iteracionesX == 1);
    return [errorestabla, iteraciones, xitabla];
  }
}

TextEditingController _textEditingController = TextEditingController();

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
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
                                builder: (context) => NewtonRaphson()),
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

class Datos {
  late String funcion,funcionDerivada,funcionSegundaDerivada;
  late double xInicial,error;

  Datos.normal(this.funcion, this.funcionDerivada, this.xInicial, this.error);

  Datos.withSegundaDerivada(
      this.funcion, this.funcionDerivada, this.funcionSegundaDerivada, this.xInicial, this.error);
}

class NewtonRaphsonMejorado extends StatefulWidget {
  @override
  _NewtonRaphsonMejoradoState createState() => _NewtonRaphsonMejoradoState();
}


class NewtonRaphson extends StatefulWidget {
  @override
  _NewtonRaphsonState createState() => _NewtonRaphsonState();
}

class _NewtonRaphsonState extends State<NewtonRaphson> {

  final formKey = new GlobalKey<FormState>();
  var funcion_Controller = new TextEditingController();
  var funcionDerivada_Controller = new TextEditingController();
  var funcionSegundaDerivada_Controller = new TextEditingController();
  var xInicial_Controller = new TextEditingController();
  var errorEncontrar_Controller = new TextEditingController();

  validate() {
    if (formKey.currentState!.validate()) {
      String funcion = funcion_Controller.text;
      String funcionDerivada = funcionDerivada_Controller.text;
      String funcionSegundaDerivada = funcionSegundaDerivada_Controller.text;
      double xInicial = double.parse(xInicial_Controller.text);
      double error = double.parse(errorEncontrar_Controller.text);

      // Convertir texto en Expression
      Parser p = Parser();
      Expression expFuncion = p.parse(funcion);
      Expression expDerivada = p.parse(funcionDerivada);
      Expression expSegundaDerivada = p.parse(funcionSegundaDerivada);

      // Evaluar la expresión usando un `ContextModel`
      ContextModel cm = ContextModel();
      cm.bindVariableName('x', Number(xInicial));
      double resultadoFuncion = expFuncion.evaluate(EvaluationType.REAL, cm);
      double resultadoDerivada = expDerivada.evaluate(EvaluationType.REAL, cm);
      double resultadoSegundaDerivada = expSegundaDerivada.evaluate(EvaluationType.REAL, cm);

      Datos datos = Datos.normal(
          funcion, funcionDerivada,  xInicial, error);

      funcion_Controller.text = "";
      funcionDerivada_Controller.text = "";
      funcionSegundaDerivada_Controller.text = "";
      xInicial_Controller.text = " ";
      errorEncontrar_Controller.text = " ";
    }
  }
  bool NotDoubleCheck(var N) {
    final V = double.tryParse(N);

    if (V == null) {
      print("Not Double");
      return true;
    } else {
      print("Double");
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Newton Raphson'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: formKey, // referencia a la clave global del formulario
            autovalidateMode: AutovalidateMode.always, // activa la validación automática
            child: SingleChildScrollView(
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
                  validator: (val) =>
                  val?.length == 0 ? 'No has ingresado la funcion' : null,
                ),
                TextFormField(
                  decoration:
                  InputDecoration(hintText: 'Introduce la funcion derivada: '),
                  controller: funcionDerivada_Controller,
                  keyboardType: TextInputType.text,
                  validator: (val) =>
                  val?.length == 0 ? 'No has ingresado la funcion' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Introduce la segunda derivada de la funcion: '),
                  controller: funcionSegundaDerivada_Controller,
                  keyboardType: TextInputType.text,
                  validator: (val) =>
                  val?.length == 0 ? 'No has ingresado la funcion' : null,
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
                        validator: (val) => NotDoubleCheck(val)
                            ? 'Introduce un valor numerico'
                            : null,
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
                        validator: (val) => NotDoubleCheck(val)
                            ? 'Introduce un valor numerico'
                            : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed:validate,
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
                  rows: _rowsNormal,
                ),
              ],
            ),
          ),
          ),
        )
    );
  }
}



class _NewtonRaphsonMejoradoState extends State<NewtonRaphsonMejorado> {

  final formKey = new GlobalKey<FormState>();
  var funcion_Controller = new TextEditingController();
  var funcionDerivada_Controller = new TextEditingController();
  var funcionSegundaDerivada_Controller = new TextEditingController();
  var xInicial_Controller = new TextEditingController();
  var errorEncontrar_Controller = new TextEditingController();

  validate() {
    if (formKey.currentState!.validate()) {
      String funcion = funcion_Controller.text;
      String funcionDerivada = funcionDerivada_Controller.text;
      String funcionSegundaDerivada = funcionSegundaDerivada_Controller.text;
      double xInicial = double.parse(xInicial_Controller.text);
      double error = double.parse(errorEncontrar_Controller.text);
      Datos datos = Datos.withSegundaDerivada(
          funcion, funcionDerivada, funcionSegundaDerivada, xInicial, error);

      funcion_Controller.text = "";
   funcionDerivada_Controller.text = "";
      funcionSegundaDerivada_Controller.text = "";
     xInicial_Controller.text = " ";
     errorEncontrar_Controller.text = " ";
    }
  }
  bool NotDoubleCheck(var N) {
    final V = double.tryParse(N);

    if (V == null) {
      print("Not Double");
      return true;
    } else {
      print("Double");
      return false;
    }
  }
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
            child: SingleChildScrollView(
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
                  validator: (val) =>
                  val?.length == 0 ? 'No has ingresado la funcion' : null,
                ),
                TextFormField(
                  decoration:
                  InputDecoration(hintText: 'Introduce la funcion derivada: '),
                  controller: funcionDerivada_Controller,
                  keyboardType: TextInputType.text,
                  validator: (val) =>
                  val?.length == 0 ? 'No has ingresado la funcion' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Introduce la segunda derivada de la funcion: '),
                  controller: funcionSegundaDerivada_Controller,
                  keyboardType: TextInputType.text,
                  validator: (val) =>
                  val?.length == 0 ? 'No has ingresado la funcion' : null,
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
                        validator: (val) => NotDoubleCheck(val)
                            ? 'Introduce un valor numerico'
                            : null,
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
                        validator: (val) => NotDoubleCheck(val)
                            ? 'Introduce un valor numerico'
                            : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed:validate,
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
                  rows: _rowsMejorado,
                ),
              ],
            ),
          ),
          ),
        )
    );
  }
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

NewtonNormal metodos = new NewtonNormal();
List<dynamic> resultados = metodos.problema1([], [], []);
List<double> errorestabla = resultados[0];
List<int> iteraciones = resultados[1];
List<double> xitabla = resultados[2];

List<DataRow> _rowsNormal = createDataRowList(iteraciones, xitabla, errorestabla);

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


//Filas para tabla de Newton Mejorado
MetodoMejorado mejorado = new MetodoMejorado();
List<dynamic> resultadosMejorado = mejorado.problema2([], [], [],0,1);
List<double> errorestablaMejorado = resultadosMejorado[0];
List<int> iteracionesMejorado = resultadosMejorado[1];
List<double> xitablaMejorado = resultadosMejorado[2];

List<DataRow> createDataRowListMejorado(
    List<int> iteracionesMejorado, List<double> xitablaMejorado, List<double> errorestablaMejorado) {
  return iteracionesMejorado.map((iteracionMejorado) {
    int index = iteracionesMejorado.indexOf(iteracionMejorado);
    return DataRow(cells: [
      DataCell(Text(iteracionMejorado.toString())),
      DataCell(Text(xitablaMejorado[index].toString())),
      DataCell(Text(errorestablaMejorado[index].toString())),
    ]);
  }).toList();
}
List<DataRow> _rowsMejorado = createDataRowListMejorado(iteracionesMejorado, xitablaMejorado, errorestablaMejorado);


class NewtonNormal {
  List<dynamic> problema1(
      List<int> iteraciones, List<double> xitabla, List<double> errorestabla,expFuncion ,expDerivada ,xInicial ,error ) {
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
  List<dynamic> problema2(List<int> iteracionesMejorado, List<double> xitablaMejorado,
      List<double> errorestablaMejorado, double xi, double error) {
    iteracionesMejorado.clear();
    xitablaMejorado.clear();
    errorestablaMejorado.clear();
    int iteracionesX = 0;
    double fxi, dfxi, ddfxi, xn, errorPorcentual;
    do {
      fxi = pow(xi, 4) - 6 * pow(xi, 3) + 12 * pow(xi, 2) - 10 * xi + 3;
      dfxi = 4 * pow(xi, 3) - 18 * pow(xi, 2) + 24 * xi - 10;
      ddfxi = 12 * pow(xi, 2) - 36 * xi + 24;
      xn = xi - ((fxi * dfxi) / ((pow(dfxi, 2)) - (fxi * ddfxi)));
      errorPorcentual = ((xn - xi) / xn).abs() * 100;
      xi = xn;
      xitablaMejorado.add(double.parse(xi.toStringAsFixed(5)));
      errorestablaMejorado.add(double.parse(errorPorcentual.toStringAsFixed(5)));// errorPorcentual
      iteracionesMejorado.add(iteracionesX);
      iteracionesX++;
    } while (errorPorcentual > error || iteracionesX == 1);
    return [errorestablaMejorado, iteracionesMejorado, xitablaMejorado];
  }
}

TextEditingController _textEditingController = TextEditingController();

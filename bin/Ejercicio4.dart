import 'dart:io';

class RegistroTemperatura {
  String ciudad;
  List<double> temperaturas = [];

  RegistroTemperatura(this.ciudad, this.temperaturas);

  void ingresarTemperaturas() {
    for (int i = 0; i < 5; i++) {
      stdout.write('Ingrese la temperatura ${i + 1} en $ciudad: ');
      double temp = double.parse(stdin.readLineSync() ?? '0');
      temperaturas.add(temp);
    }
  }
  double calcularPromedio() {
    double suma = 0;
    for (double temp in temperaturas) {
      suma += temp;
    }
    return suma / temperaturas.length;
  }
  int ContarDiasCalurosos() {
    int diasCalurosos = 0;
    for (double temp in temperaturas) {
      if (temp > 30) {
        diasCalurosos++;
      }
    }
    return diasCalurosos;
  }
  void mostrar() {
    print('Ciudad: $ciudad');
    print('Temperaturas registradas: ${temperaturas.join(', ')}');
    print('Promedio de temperaturas: ${calcularPromedio().toStringAsFixed(2)}');
    print('Cantidad de días calurosos (temperatura > 30°C): ${ContarDiasCalurosos()}');
  }
}
void main() {
  stdout.write('Ingrese el nombre de la ciudad: ');
  String ciudad = stdin.readLineSync() ?? '';
  RegistroTemperatura registro = RegistroTemperatura(ciudad, []);
  registro.ingresarTemperaturas();
  registro.mostrar();
}
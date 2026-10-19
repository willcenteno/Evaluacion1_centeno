import 'dart:io';

class Estudiante {
  String alumno;
  List<double> notas;

  Estudiante(this.alumno, this.notas);

  static bool validarNota(double nota) {
    return nota >= 0 && nota <= 20;
  }
  double promedio() {
    double suma = 0;
    for (double nota in notas) {
      suma += nota;
    }
    return suma / notas.length;
  }
  String estado() {
    double prom = promedio();
    if (prom >= 13) {
      return 'Aprobado';
    } else {
      return 'Desaprobado';
    }
  }

  void mostrar() {
    print('Alumno: $alumno');
    for (int i = 0; i < notas.length; i++) {
      print('Nota ${i + 1}: ${notas[i]}');
    }
    print('Promedio: ${promedio().toStringAsFixed(2)}');
    print('Estado: ${estado()}');
  }
}
void main() {
  stdout.write('Ingrese el nombre del Alumno: ');
  String nombre = stdin.readLineSync() ?? '';

  List<double> notas = List.generate(3, (i) {
    double nota;
    do {
      stdout.write('Ingrese la nota ${i + 1}: ');
      nota = double.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (!Estudiante.validarNota(nota)) {
        print('Nota inválida. Debe estar entre 0 y 20.');
      }
    } while (!Estudiante.validarNota(nota));
    return nota;
  });

  Estudiante estudiante = Estudiante(nombre, notas);
  estudiante.mostrar();
}
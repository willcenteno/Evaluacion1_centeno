import 'dart:io';

class Vendedor {
  String nombre;
  double ventas;

  Vendedor(this.nombre, this.ventas);
  double calcularComision() {
    if (ventas <= 2000) {
      return ventas * 0.05;
    } else {
      return ventas * 0.10;
    }
  }
  void mostrar() {
    print('Nombre del vendedor: $nombre');
    print('Ventas: $ventas');
    print('Comisión: ${calcularComision()}');
  }

}
void main() {
  stdout.write('Ingrese el nombre del vendedor: ');
  String nombre = stdin.readLineSync() ?? '';
  stdout.write('Ingrese el monto de ventas: ');
  double ventas = double.parse(stdin.readLineSync() ?? '0');
  while (ventas < 0) {
    print('Error: las ventas no pueden ser negativas.');
    stdout.write('Ingrese nuevamente el monto de ventas: ');
    ventas = double.parse(stdin.readLineSync() ?? '0');
  }
  Vendedor vendedor = Vendedor(nombre, ventas);
  vendedor.mostrar();
}
import 'dart:io';

class Producto {
  String nombre;
  double precio;
  int cantidad;

  Producto(this.nombre, this.precio, this.cantidad);

  double calcularvalorinventario() {
    return precio * cantidad;
  }

  String estadoStock() {
    if (cantidad == 0) {
      return 'Stock Agotado';
    } else if (cantidad <= 5 ) {
      return 'Bajo Stock';
    } else  {
    }return 'Stock Suficiente';
    }
    void mostrar(){
      print('Nombre: $nombre');
      print('Precio: $precio');
      print('Cantidad: $cantidad');
      print('Valor del inventario: ${calcularvalorinventario()}');
      print('Estado del stock: ${estadoStock()}');
    }
    
  }

void main() {
  stdout.write('Ingrese el nombre del producto: ');
  String nombre = stdin.readLineSync() ?? '';
  stdout.write('Ingrese el precio del producto: ');
  double precio = double.parse(stdin.readLineSync() ?? '0');
  while (precio <= 0) {
    print('Error: el precio debe ser mayor que cero.');
    stdout.write('Ingrese nuevamente el precio: ');
    precio = double.parse(stdin.readLineSync() ?? '0');
  }
  stdout.write('Ingrese la cantidad disponible: ');
  int cantidad = int.parse(stdin.readLineSync() ?? '0');
  while (cantidad < 0) {
    print('Error: la cantidad no puede ser negativa.');
    stdout.write('Ingrese nuevamente la cantidad: ');
    cantidad = int.parse(stdin.readLineSync() ?? '0');
  }
  Producto producto = Producto(nombre, precio, cantidad);
  producto.mostrar();
}

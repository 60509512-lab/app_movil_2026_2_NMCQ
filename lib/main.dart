import 'package:flutter/material.dart';

void main() {
  runApp(const MiPerfilApp());
}

class MiPerfilApp extends StatelessWidget {
  const MiPerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PerfilAcademicoScreen(),
    );
  }
}

class PerfilAcademicoScreen extends StatefulWidget {
  const PerfilAcademicoScreen({super.key});

  @override
  State<PerfilAcademicoScreen> createState() => _PerfilAcademicoScreenState();
}

class _PerfilAcademicoScreenState extends State<PerfilAcademicoScreen> {
  final String nombreEstudiante = "Nayza Margot Cari Quispe";
  final int np = 12;
  final double promedioPonderado = 16.5;
  final bool estaMatriculado = true;

  late int logrosAcademicos;

  @override
  void initState() {
    super.initState();
    logrosAcademicos = np;
  }

  void _sumarLogro() {
    setState(() {
      logrosAcademicos++;
    });
  }

  String obtenerMensajeParidad() {
    if (np % 2 == 0) {
      return "Tu número personal es par";
    } else {
      return "Tu número personal es impar";
    }
  }

  String obtenerMensajeNivel() {
    if (np > 50) {
      return "Número personal alto";
    } else {
      return "Número personal bajo";
    }
  }

  List<int> calcularMultiplos() {
    List<int> multiplos = [];
    for (int i = 1; i <= 5; i++) {
      multiplos.add(np * i);
    }
    return multiplos;
  }

  @override
  Widget build(BuildContext context) {
    List<int> listaMultiplos = calcularMultiplos();

    return Scaffold(
      appBar: AppBar(
        title: Text(nombreEstudiante),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Datos Académicos",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Text("Estudiante: $nombreEstudiante"),
                    Text("Número Personal (NP): $np"),
                    Text("Promedio Ponderado: $promedioPonderado"),
                    Text(
                      "Estado de Matrícula: ${estaMatriculado ? 'Matriculado (Activo)' : 'No Matriculado'}",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              color: Colors.blue.shade50,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Clasificación del NP (Lógica if-else)",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text("• ${obtenerMensajeParidad()}"),
                    Text("• ${obtenerMensajeNivel()}"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Múltiplos del NP (Generados con bucle for)",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(listaMultiplos.length, (index) {
                        int posicion = index + 1;
                        int valor = listaMultiplos[index];
                        return Text(
                          "Múltiplo $posicion: $np x $posicion = $valor",
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              color: Colors.green.shade50,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        "Contador de Logros Académicos",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "$logrosAcademicos",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        onPressed: _sumarLogro,
                        icon: const Icon(Icons.add),
                        label: const Text("Sumar logro"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// A small square widget representing a node for selection or emphasis.
class NodeWidget extends StatelessWidget {
  final Color color;

  const NodeWidget({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 1.5),
      ),
    );
  }
}

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    const Color azulDiseno = Color(0xFF0097D7);
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 600;

    return Scaffold(
      backgroundColor: azulDiseno,
      appBar: AppBar(
        title: const Text(
          "UX CATALOG EDITOR",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.grid_view),
            onPressed: () {},
          ),
          const SizedBox(width: 5),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isWideScreen ? 450 : screenWidth * 0.95),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: isWideScreen ? 750 : MediaQuery.of(context).size.height * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(offset: Offset(6, 6), color: Colors.black)
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      // 1. Regla superior
                      Image.network(
                        "https://raw.githubusercontent.com/VaniaJS/mis_imagenes/main/regla_top.png",
                        height: 25,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        errorBuilder: (BuildContext c, Object e, StackTrace? s) => Container(height: 25, color: Colors.grey[200]),
                      ),

                      const SizedBox(height: 20),

                      // 2. Título
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "NEW SEASON\nCOLLECTION",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: (screenWidth * 0.08).clamp(24, 40),
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1,
                            height: 1.1,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // 3. Contenedor de Imagen con Nodos
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: azulDiseno, width: 2),
                                ),
                                child: ClipRRect(
                                  child: Image.network(
                                    "https://images.unsplash.com/photo-1539109136881-3be0616acf4b?q=80&w=1000&auto=format&fit=crop",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                    errorBuilder: (BuildContext c, Object e, StackTrace? s) => const Icon(Icons.style, size: 50, color: azulDiseno),
                                  ),
                                ),
                              ),
                              Positioned(top: -6, left: -6, child: NodeWidget(color: azulDiseno)),
                              Positioned(top: -6, right: -6, child: NodeWidget(color: azulDiseno)),
                              Positioned(bottom: -6, left: -6, child: NodeWidget(color: azulDiseno)),
                              Positioned(bottom: -6, right: -6, child: NodeWidget(color: azulDiseno)),
                            ],
                          ),
                        ),
                      ),

                      // 4. Texto descriptivo inferior
                      Container(
                        margin: const EdgeInsets.fromLTRB(25, 25, 25, 10),
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: const Text(
                          "SKU: ART-NX75-001\nSIZE: M\nCOLOR: #FFFFFF\nPRICE: \$99.99",
                          style: TextStyle(fontFamily: 'monospace', fontSize: 12, color: Colors.black87),
                        ),
                      ),

                      // --- NUEVO BOTÓN PARA DIRIGIR A LA PANTALLA 3 ---
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/pantalla3'),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.black),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "CONTINUAR AL PAGO >",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
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
          ),
        ),
      ),
    );
  }
}
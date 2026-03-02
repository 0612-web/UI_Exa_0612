import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    const Color azulDiseno = Color(0xFF0097D7);
    
    final double screenWidth = MediaQuery.of(context).size.width;
    // Determinamos si es web/tablet o móvil para ajustar tamaños
    final bool isWideScreen = screenWidth > 600;

    return Scaffold(
      backgroundColor: azulDiseno,
      appBar: AppBar(
        title: const Text("FASHION EDITOR", 
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        actions: const [
          Icon(Icons.crop_free, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.settings, color: Colors.white),
          SizedBox(width: 15)
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
                    boxShadow: const [
                      BoxShadow(offset: Offset(6, 6), color: Colors.black)
                    ],
                  ),
                  child: Column(
                    children: [
                      // 1. Regla superior
                      Image.network(
                        "https://raw.githubusercontent.com/VaniaJS/mis_imagenes/main/regla_top.png",
                        height: 25,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        errorBuilder: (c, e, s) => Container(height: 25, color: Colors.grey[200]),
                      ),

                      // 2. Datos personales
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Vania Jimenez Sanchez 6to gpo i #0612",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: (screenWidth * 0.035).clamp(12, 16), 
                            color: const Color(0xFF424242), 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                      // 3. Área de imagen con la "X" de diseño e IMAGEN DE ROPA
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: azulDiseno, width: 2.5)
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Líneas de diseño (X) al fondo
                                Positioned.fill(
                                  child: CustomPaint(painter: CrossPainter(azulDiseno.withOpacity(0.3))),
                                ),
                                // IMAGEN DE ROPA DE MUJER (Unsplash Fashion)
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.network(
                                    "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=1000&auto=format&fit=crop",
                                    fit: BoxFit.contain,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const CircularProgressIndicator(color: azulDiseno);
                                    },
                                    errorBuilder: (c, e, s) => const Icon(Icons.shopping_bag_outlined, size: 60, color: azulDiseno),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // 4. Sección de Títulos
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Column(
                          children: [
                            Text("FASHION", 
                              style: TextStyle(
                                fontSize: (screenWidth * 0.1).clamp(30, 48), 
                                fontWeight: FontWeight.w900, 
                                height: 0.9,
                                letterSpacing: -1
                              )
                            ),
                            Text("COLLECTION", 
                              style: TextStyle(
                                fontSize: (screenWidth * 0.1).clamp(30, 48), 
                                fontWeight: FontWeight.w900, 
                                height: 0.9,
                                letterSpacing: -1
                              )
                            ),
                            const SizedBox(height: 8),
                            Text("VANIA JIMENEZ", 
                              style: TextStyle(
                                fontSize: (screenWidth * 0.05).clamp(16, 22), 
                                color: azulDiseno, 
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5
                              )
                            ),
                          ],
                        ),
                      ),

                      // 5. Botón de navegación
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/pantalla2'),
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          color: Colors.black,
                          alignment: Alignment.center,
                          child: const Text(
                            "EXPLORAR CATÁLOGO >", 
                            style: TextStyle(
                              color: Colors.white, 
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2
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

class CrossPainter extends CustomPainter {
  final Color color;
  const CrossPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color..strokeWidth = 2.0;
    canvas.drawLine(Offset.zero, Offset(size.width, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
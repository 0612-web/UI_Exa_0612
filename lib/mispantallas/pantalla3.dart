import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    const Color azulDiseno = Color(0xFF0097D7);
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 600;

    return Scaffold(
      backgroundColor: azulDiseno,
      appBar: AppBar(
        title: const Text("VISUAL EDITOR MODE", 
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isWideScreen ? 450 : screenWidth * 0.95),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2),
                boxShadow: const [BoxShadow(offset: Offset(6, 6), color: Colors.black)],
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

                  // 2. Sección Superior
                  Expanded(
                    flex: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 55,
                          decoration: const BoxDecoration(
                            border: Border(right: BorderSide(width: 1), bottom: BorderSide(width: 1)),
                          ),
                          child: Column(
                            children: const [
                              _ToolIcon(icon: Icons.text_fields, isSelected: true),
                              _ToolIcon(icon: Icons.edit_note),
                              _ToolIcon(icon: Icons.colorize),
                              _ToolIcon(icon: Icons.search),
                              _ToolIcon(icon: Icons.layers, isLast: true),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(border: Border.all(width: 1)),
                            child: Column(
                              children: [
                                Container(color: azulDiseno, height: 20, width: double.infinity),
                                const _LayerItem(label: "Product_Photo_01"),
                                const _LayerItem(label: "Text_Heading"),
                                const _LayerItem(label: "Background_Pattern"),
                                const _LayerItem(label: "Logo_Vania"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 3. SECCIÓN CENTRAL
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: azulDiseno, width: 1.5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("VISUAL", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900, height: 0.9)),
                                Text("DESIGNER", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900, height: 0.9)),
                              ],
                            ),
                          ),
                          // Nodos corregidos
                          Positioned(top: -5, left: -5, child: _nodo()),
                          Positioned(top: -5, right: -5, child: _nodo()),
                          Positioned(bottom: -5, left: -5, child: _nodo()),
                          Positioned(bottom: -5, right: -5, child: _nodo()),
                        ],
                      ),
                    ),
                  ),

                  // 4. BARRA INFERIOR
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Container(height: 15, color: Colors.black, width: double.infinity),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: const BoxDecoration(color: azulDiseno),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: const Text("WWW.VANIAFASHION.COM", 
                            style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),

                  TextButton(
                    onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
                    child: const Text("< FINALIZAR EDICIÓN", 
                      style: TextStyle(color: Colors.black, decoration: TextDecoration.underline, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // FUNCIÓN CORREGIDA SIN EL ERROR DE COLOR/DECORATION
  Widget _nodo() => Container(
    width: 10, 
    height: 10, 
    decoration: BoxDecoration(
      color: const Color(0xFF0097D7), 
      border: Border.all(width: 0.5, color: Colors.black),
    ),
  );
}

class _ToolIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final bool isLast;
  const _ToolIcon({super.key, required this.icon, this.isSelected = false, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[200] : Colors.transparent,
        border: Border(bottom: BorderSide(width: isLast ? 0 : 1)),
      ),
      child: Icon(icon, color: isSelected ? const Color(0xFF0097D7) : Colors.black),
    );
  }
}

class _LayerItem extends StatelessWidget {
  final String label;
  const _LayerItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 0.5))),
      child: Row(
        children: [
          const Icon(Icons.visibility, size: 14),
          const SizedBox(width: 5),
          Container(
            width: 10, 
            height: 10, 
            decoration: const BoxDecoration(color: Color(0xFF0097D7)),
          ),
          const SizedBox(width: 5),
          Expanded(child: Container(height: 2, color: Colors.grey[300])),
        ],
      ),
    );
  }
}
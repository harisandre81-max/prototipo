import 'package:flutter/material.dart';

class MenuUI extends StatelessWidget {
  const MenuUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // SUB MENÚ SUPERIOR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE6F0D5),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.verified_user,
            color: Colors.deepPurple,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.person,
              color: Colors.orange,
            ),
          )
        ],
      ),

      body: Column(
  children: [

    const SizedBox(height: 20),

    // ===============================
    // CONTENEDOR SUPERIOR (SCROLL HORIZONTAL)
    // W: 388 / H: 398
    // ===============================
    Center(
      child: Container(
        width: 388,
        height: 398,
        decoration: BoxDecoration(
          color: const Color(0xFFE6F0D5),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _HorizontalBox(),
              const SizedBox(width: 23),
              _HorizontalBox(),
              const SizedBox(width: 23),
              _HorizontalBox(),
            ],
          ),
        ),
      ),
    ),

    // ESPACIO ENTRE CONTENEDORES
    const SizedBox(height: 83),

    // ===============================
    // CONTENEDOR INFERIOR (SCROLL VERTICAL)
    // W: 388 / H: 735
    // ===============================
    Center(
      child: Container(
        width: 388,
        height: 735,
        decoration: BoxDecoration(
          color: const Color(0xFFE6F0D5),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _VerticalBox(),
              const SizedBox(height: 20),
              _VerticalBox(),
              const SizedBox(height: 20),
              _VerticalBox(),
              const SizedBox(height: 20),
              _VerticalBox(),
              const SizedBox(height: 20),
              _VerticalBox(),
              const SizedBox(height: 20),
              _VerticalBox(),
              const SizedBox(height: 20),
              _VerticalBox(),
              const SizedBox(height: 20),
              _VerticalBox(),
              const SizedBox(height: 20),
              _VerticalBox(),
              const SizedBox(height: 20),
              _VerticalBox(),
              const SizedBox(height: 20),
              _VerticalBox(),
              const SizedBox(height: 20),
              _VerticalBox(),
              const SizedBox(height: 20),
              _VerticalBox(),
            ],
          ),
        ),
      ),
    ),

    const Spacer(),

          // SUB MENÚ INFERIOR
          Container(
            height: 140,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFE6F0D5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class _HorizontalBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159,
      height: 398,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

class _VerticalBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 386,
      height: 87,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

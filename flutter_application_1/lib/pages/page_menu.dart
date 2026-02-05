import 'package:flutter/material.dart';
import 'page_user_data.dart';
import 'page_home.dart';
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.orange,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserListScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),


      body: Stack(
  children: [

    // ===============================
    // CONTENIDO NORMAL (CON SCROLL)
    // ===============================
    Column(
      children: [

        const SizedBox(height: 20),

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [

                // TU CONTENEDOR HORIZONTAL
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

                const SizedBox(height: 83),

                Column(
                  children: [
                    _VerticalBox(),
                    const SizedBox(height: 20),
                    _VerticalBox(),
                    const SizedBox(height: 20),
                    _VerticalBox(),
                    const SizedBox(height: 20),
                    _VerticalBox(),
                  ],
                ),

                const SizedBox(height: 160), // espacio para el menú inferior
              ],
            ),
          ),
        ),

        
    // ===============================
    // SUB MENÚ INFERIOR (FIJO)
    // ===============================
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

    // ===============================
    // BOTÓN FLOTANTE FIJO
    // ===============================
    Positioned(
      right: 16,
      top: MediaQuery.of(context).size.height / 2 - 20,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 22,
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
        color: const Color.fromARGB(255, 145, 55, 55),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

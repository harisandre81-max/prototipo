import 'package:flutter/material.dart';
import 'page_user_data.dart';
import 'page_inicio_de_sesion.dart';
import 'page_carga.dart';
import 'dart:async';

class MenuUI extends StatelessWidget {
  const MenuUI({super.key});

  Future<void> showLoading(BuildContext context, {int seconds = 3}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const LoadingScreen(),
  );

  await Future.delayed(Duration(seconds: seconds));
  Navigator.of(context).pop();
  }

  void showEmergencyPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const EmergencyPopup(),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // SUB MENÚ SUPERIOR
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: const Color(0xFFE6F0D5),
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
             size: 36,
            Icons.verified_user,
            color: Colors.deepPurple,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(

              icon: const Icon(
                size: 36,
                Icons.person,
                color: Colors.orange,
              ),
              onPressed: () async{
                await showLoading(context, seconds: 3);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserProfilePage(),
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
              const SizedBox(height: 20),
                // TU CONTENEDOR HORIZONTAL
                Center(
                  child: Container(
                    width: 388,
                    height: 220,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 233, 245, 212),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _VerticalUserCard(
                            name: 'Josh Fechter',
                            age: '32',
                            relation: 'Hermano',
                            phone: '+88 01828 9457 20',
                            image: 'assets/avatar.png',
                          ),

                          const SizedBox(width: 23),
                          _VerticalUserCard(
                            name: 'Josh Fechter',
                            age: '32',
                            relation: 'Hermano',
                            phone: '+88 01828 9457 20',
                            image: 'assets/avatar.png',
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 100),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 20),

                      _HorizontalButton(
                        text: 'Tipos de violencia',
                        image: 'assets/imagenes/img1.jpeg',
                      ),
                      const SizedBox(width: 16),

                      _HorizontalButton(
                        text: 'Derechos de los nna',
                        image: 'assets/imagenes/img2.jpeg',
                      ),

                      const SizedBox(width: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Column(
  children: [
    _VerticalBox(
      text: 'Hola',
      onTap: () {
    showDetailCard(
      context,
      UserInfo(
        name: 'Josh Fechter',
        phone: '+88 01828 9457 20',
        address: 'Ciudad de México',
        description: 'Contacto de confianza para emergencias.',
        image: 'assets/avatar.png',
      ),
    );
  },
    ),
    const SizedBox(height: 20),

    _VerticalBox(
      text: '¿Cómo estás?',
      onTap: () {
    showDetailCard(
      context,
      UserInfo(
        name: 'Fechter',
        phone: '+88 01828 9457 20',
        address: 'Ciudad de México',
        description: 'Contacto de confianza para emergencias.',
        image: 'assets/avatar.png',
      ),
    );
  },
    ),
    const SizedBox(height: 20),

    _VerticalBox(
      text: 'Bienvenido, Luis',
      onTap: () {
    showDetailCard(
      context,
      UserInfo(
        name: 'Josh Fer',
        phone: '+88 01828 9457 20',
        address: 'Ciudad de México',
        description: 'Contacto de confianza para emergencias.',
        image: 'assets/avatar.png',
      ),
    );
  },
    ),
  ],
),

                const SizedBox(height: 20), // espacio para el menú inferior
              ],
            ),
          ),
        ),

        
    // ===============================
    // SUB MENÚ INFERIOR (FIJO)
    // ===============================
    Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFE6F0D5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      
      child: Center(
       child: Transform.translate(
        offset: const Offset(0, -40),
        child: GestureDetector(
      onTap: () {
        showEmergencyPopup(context);
      },
        child: Container(
          width: 100,
          height: 100,
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
      ),
    ),
      ],
    ),

    // ===============================
    // BOTÓN FLOTANTE FIJO
    // ===============================
    Positioned(
      right: 20,
      top: MediaQuery.of(context).size.height / 2 - 20,
      child: GestureDetector(
        onTap: () async {
          await showLoading(context, seconds: 3);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InicioDeSesion(),
            ),
          );
        },
        child: Container(
          width: 50,
          height: 50,
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
class _VerticalUserCard extends StatelessWidget {
  final String name;
  final String age;
  final String relation;
  final String phone;
  final String image;

  const _VerticalUserCard({
    required this.name,
    required this.age,
    required this.relation,
    required this.phone,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(237, 255, 255, 255),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // IMAGEN
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(image), // o NetworkImage
          ),

          const SizedBox(width: 32),

          // INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.deepPurple)),
                const SizedBox(height: 8),
                Text('Edad: $age'),
                Text('Parentezco: $relation'),
                Text(phone),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _VerticalBox extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _VerticalBox({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 386,
        height: 87,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(239, 233, 245, 212),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            const SizedBox(width: 50),
            Text(
              text, // 👈 TEXTO VARIABLE
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HorizontalButton extends StatelessWidget {
  final String text;
  final String image;

  const _HorizontalButton({
    required this.text,
    required this.image,
  });

  
  @override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black54,
        builder: (_) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Image.asset(image, fit: BoxFit.contain),
              ),
            ),
          );
        },
      );
    },
    child: Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
}

class EmergencyPopup extends StatefulWidget {
  const EmergencyPopup({super.key});

  @override
  State<EmergencyPopup> createState() => _EmergencyPopupState();
}

class _EmergencyPopupState extends State<EmergencyPopup>
    with SingleTickerProviderStateMixin {
  int _countdown = 3;
  Timer? _timer;
  late AnimationController _anim;

  @override
  void initState() {
    super.initState();

    // Animación de pulso
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      lowerBound: 0.9,
      upperBound: 1.05,
    )..repeat(reverse: true);

    // Contador
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown == 1) {
        timer.cancel();
        // 👉 AQUÍ disparas la acción real
        print('🚨 EMERGENCIA ACTIVADA');
      }
      setState(() {
        _countdown--;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _anim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.redAccent.withOpacity(0.95),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _anim,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Text(
                  '$_countdown',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 100),

            const Text(
              'Enviando alerta en...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Enviando alerta a tus contactos, mantente a salvo.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
            ),

            const SizedBox(height: 100),

            // AVATARES
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(radius: 22, backgroundImage: AssetImage('assets/avatar.png')),
                SizedBox(width: 12),
                CircleAvatar(radius: 22, backgroundImage: AssetImage('assets/avatar.png')),
                SizedBox(width: 12),
                CircleAvatar(radius: 22, backgroundImage: AssetImage('assets/avatar.png')),
              ],
            ),

            const SizedBox(height: 100),

            // BOTÓN CANCELAR
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
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

class UserInfo {
  final String name;
  final String phone;
  final String address;
  final String description;
  final String image;

  UserInfo({
    required this.name,
    required this.phone,
    required this.address,
    required this.description,
    required this.image,
  });
}
//mas info
void showDetailCard(BuildContext context, UserInfo user) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Cerrar', // 👈 OBLIGATORIO
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 300),

    pageBuilder: (_, __, ___) {
      return  Align(
    alignment: Alignment.bottomCenter, 
    child: Padding(
      padding: const EdgeInsets.only(bottom: 40),
        child: Container(
          width: 388,
          height: 300,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(user.image),
              ),
              const SizedBox(height: 12),
              Text(user.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.deepPurple)),
              const SizedBox(height: 8),
              Text(user.phone,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.deepPurple)),
              const SizedBox(height: 8),
              Text(user.address,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.deepPurple)),
              const SizedBox(height: 8),
              Text(user.description,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.deepPurple)),
            ],
          ),
        ),
      ),
      );
    },

    transitionBuilder: (_, animation, __, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}
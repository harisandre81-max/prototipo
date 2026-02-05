import 'dart:async';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int _currentIndex = 0;
  late Timer _timer;

  // Lista de imágenes (assets)
  final List<String> _images = [
    'assets/images/logo1.png',
    'assets/images/logo2.png',
    'assets/images/logo3.png',
  ];

  @override
  void initState() {
    super.initState();

    // Cambia la imagen cada 2 segundos
    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length;
      });
    });

Future<void> showLoading(BuildContext context, {int seconds = 2}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const LoadingScreen(),
  );

  await Future.delayed(Duration(seconds: seconds));

  Navigator.of(context).pop(); // cerrar loading
}

  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6EED2),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
          child: Image.asset(
            _images[_currentIndex],
            key: ValueKey(_images[_currentIndex]),
            width: 220,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

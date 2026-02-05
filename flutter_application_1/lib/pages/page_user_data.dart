import 'package:flutter/material.dart';
import 'page_menu.dart';
class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7ED),
      body: Column(
        children: [
          // Header
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Color(0xFFDDE8C8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo placeholder
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.shield,
                    color: Color(0xFF7A8F4E),
                  ),
                ),

                // Home icon
                IconButton(
                  icon: const Icon(
                    Icons.home,
                    size: 30,
                    color: Color(0xFFF6B26B),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MenuUI(),
                      ),
                    );
                  },
                ),

              ],
            ),
          ),

          const SizedBox(height: 20),

          // First user (flat card)
          Container(
            
  height: 200,
  width: double.infinity,
  color: Colors.tealAccent,
  
  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _Avatar(),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Luis Fernando Herrera Perez',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6B4E9B),
              ),
            ),
            SizedBox(height: 6),
            Text(
              '555-555-555',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6B4E9B),
              ),
            ),
          ],
        ),
      ),
      const Icon(Icons.edit, color: Color(0xFF6B4E9B)),
    ],
  ),
),


          const SizedBox(height: 30),

          // Second user (rounded card)
          SizedBox(
  height: 400,
  child: Center(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _HorizontalUserBox(),
          const SizedBox(width: 20),
          _HorizontalUserBox(),
          const SizedBox(width: 20),
          _HorizontalUserBox(),
        ],
      ),
    ),
  ),
),


          const Spacer(),

          // Emergency button
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const RadialGradient(
                  colors: [
                    Color(0xFFFF3B30),
                    Color(0xFFB00000),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Avatar widget
class _Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: const Color(0xFFEFF3E6),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: Color(0xFFF6B26B),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _HorizontalUserBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        color: const Color(0xFFDDE8C8),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          _Avatar(),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Usuario Demo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B4E9B),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '555-555-555',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6B4E9B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainOutletScreen(),
    );
  }
}

class MainOutletScreen extends StatelessWidget {
  const MainOutletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // ================= LAYER 1: DARKER BACKGROUND =================
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // STOPS: 0.4 means the first 40% is pure black, then it fades.
                stops: const [0.4, 1.0],
                colors: [
                  Colors.black,            // Start with pure black
                  Colors.green.shade900,   // End with a very dark 'forest' green
                ],
              ),
            ),
          ),

          // ================= LAYER 2: ELONGATED LOGO =================
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60), // Increased top spacing slightly

                  // --- THE WIDER LOGO ---
                  ClipRRect(
                    // Adjusted radius to keep the "stadium/pill" shape smooth
                    borderRadius: BorderRadius.circular(90.0),
                    child: Container(
                      width: 340,   // <--- ELONGATED: Much wider now
                      height: 190,  // Height stays the same
                      color: Colors.white10,

                      child: Image.asset(
                        'assets/logo1.jpeg',
                        // BoxFit.fill stretches the image to fit the new wide shape.
                        // If the text looks too stretched/fat, change back to BoxFit.cover
                        fit: BoxFit.fill,

                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.broken_image, color: Colors.red, size: 50),
                          );
                        },
                      ),
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
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
      // Setting a dark theme globally so text fields look good by default
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(primary: Colors.green),
      ),
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
      // We wrap the Stack in a GestureDetector to hide the keyboard when tapping background
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            // ================= LAYER 1: BACKGROUND =================
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.4, 1.0],
                  colors: [
                    Colors.black,
                    Colors.green.shade900,
                  ],
                ),
              ),
            ),

            // ================= LAYER 2: CONTENT =================
            SafeArea(
              child: SingleChildScrollView(
                // SingleChildScrollView prevents "Pixel Overflow" errors when keyboard opens
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),

                      // --- 1. THE LOGO ---
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Container(
                          width: 340,
                          height: 190, // Preserved your dimension
                          color: Colors.white10,
                          child: Image.asset(
                            'assets/logo1.jpeg',
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(child: Icon(Icons.broken_image, color: Colors.red));
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // --- 2. THE SEPARATOR LINE ---
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.white, thickness: 1)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Hey_there!", // Preserved your text
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.white, thickness: 1)),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // --- 3. THE LOGIN BOX ---
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black54, // Semi-transparent dark box
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.green.withOpacity(0.3)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // USERNAME FIELD
                            const TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: "Personal_ID",
                                labelStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(Icons.person_outline, color: Colors.green),
                                filled: true,
                                fillColor: Colors.white10,
                                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // PASSWORD FIELD
                            const TextField(
                              obscureText: true, // Hides the text with dots
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: "ID_Key",
                                labelStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(Icons.lock_outline, color: Colors.green),
                                suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white10,
                                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                ),
                              ),
                            ),

                            const SizedBox(height: 30),

                            // LOGIN BUTTON
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {}, // Action for Login
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green.shade800,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 5,
                                ),
                                child: const Text(
                                  "Get_in_there",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // --- 4. SIGN UP BUTTON ---
                      TextButton(
                        onPressed: () {},
                        child: RichText(
                          text: const TextSpan(
                            text: "Haven't started yet?   ",
                            style: TextStyle(color: Colors.grey),
                            children: [
                              TextSpan(
                                text: "I'm ready to start",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 60),

                      // --- 5. FOOTER (CREATED BY ADHEESH) ---
                      Column(
                        children: [
                          Text(
                            "created by",
                            style: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 4), // Tiny space between lines
                          Text(
                            "Adheesh Jain",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30), // Final bottom spacing
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
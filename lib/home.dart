import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurpleAccent, Colors.purpleAccent])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              width: 150,
              color: Colors.white.withOpacity(0.65),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Learn Flutter !",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white.withOpacity(0.65),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/questionScreen");
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white.withOpacity(0.65),
                ),
                icon: const Icon(Icons.arrow_right_alt_outlined),
                label: const Text(
                  "Start Quiz",
                ))
          ],
        ),
      ),
    );
  }
}

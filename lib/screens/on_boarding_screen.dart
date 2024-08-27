import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class BoardingScreen extends StatefulWidget {
  const BoardingScreen({
    super.key,
  });

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox.expand(
      child: Container(
        color: const Color(0xFF373535),
        padding: const EdgeInsets.only(top: 100),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Bienvenido ',
              style: GoogleFonts.raleway(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/img/onboarding/cat_with_headphones.png',
              width: 324,
              height: 324,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Todo lo que necesitas, en un solo lugar.',
              style: GoogleFonts.workSans(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text('Explora, descubre y disfruta.',
              style: GoogleFonts.scada(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
              textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0084FF),
                minimumSize: const Size(250, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                'Presiona para continuar',
                style: GoogleFonts.scada(
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    )));
  }
}

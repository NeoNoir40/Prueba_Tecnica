import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationButtons extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const NavigationButtons({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    required this.onPrevious,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: currentPage > 1 ? onPrevious : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0084FF),
              minimumSize: const Size(100, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              'Anterior',
              style: GoogleFonts.scada(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: currentPage < totalPages ? onNext : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0084FF),
              minimumSize: const Size(100, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              'Siguiente',
              style: GoogleFonts.scada(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

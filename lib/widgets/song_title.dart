import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SongTitle extends StatelessWidget {
  const SongTitle({
    super.key,
    required this.songDetails,
  });

  final Map<String, dynamic>? songDetails;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Canción ',
        style: GoogleFonts.raleway(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
        children: [
          TextSpan(
            text: songDetails!['name'] ?? 'Sin título',
            style: const TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
          TextSpan(
            text: ' de ',
            style: GoogleFonts.raleway(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: songDetails!['author'] ?? 'Desconocido',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

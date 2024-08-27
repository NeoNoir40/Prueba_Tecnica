import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SongInfo extends StatelessWidget {
  const SongInfo({
    super.key,
    required this.songDetails,
  });

  final Map<String, dynamic>? songDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Autor: ',
              style: GoogleFonts.scada(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: songDetails!['author'] ??
                      'Desconocido',
                  style: GoogleFonts.scada(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Canción: ',
              style: GoogleFonts.scada(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: songDetails!['name'] ??
                      'Sin título',
                  style: GoogleFonts.scada(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Nota de la canción: ',
              style: GoogleFonts.scada(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: songDetails!['music_note'] ??
                      'Desconocido',
                  style: GoogleFonts.scada(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Letra de la canción',
            style: GoogleFonts.scada(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              songDetails!['letter']?.isNotEmpty == true
                  ? songDetails!['letter']!
                  : 'No está disponible la letra de la canción',
              overflow: TextOverflow.visible,
              style: GoogleFonts.scada(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

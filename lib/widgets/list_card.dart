import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListCard extends StatefulWidget {
  const ListCard({
    super.key,
    required List<Map<String, String>> songs,
  }) : _songs = songs;

  final List<Map<String, String>> _songs;

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  String? _selectedSongId;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget._songs.length,
        itemBuilder: (context, index) {
          final song = widget._songs[index];
          final isSelected = song['id'] == _selectedSongId;
          return InkWell(
            onTap: () {
              setState(() {
                _selectedSongId = song['id'];
              });
              Navigator.pushNamed(
                context,
                '/song',
                arguments: song['id'] ?? '0',
              );
            },
            child: Container(
              height: 80,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF0084FF) : const Color(0xFF484545),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: Icon(Icons.music_note, color: Colors.white, size: 50),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            song['name'] ?? 'No Title',
                            style: GoogleFonts.scada(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            song['author'] ?? 'No Artist',
                            style: GoogleFonts.scada(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 60,
                    child: Icon(Icons.play_arrow_rounded,  color: isSelected ? Colors.white : const Color(0xFF0084FF) , size: 50),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

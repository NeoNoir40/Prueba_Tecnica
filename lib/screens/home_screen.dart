import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/list_card.dart';
import '../api/api.dart';
import '../widgets/navigation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> _songs = [];
  int _currentPage = 1;
  int _totalPages = 2;  // Hay solo 2 páginas
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchSongs();
  }

  Future<void> _fetchSongs() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final songs = await ApiService.fetchSongsData(_currentPage, page: _currentPage, limit: 2);

      setState(() {
        _songs = songs.map((song) => {
          'id': song['id'].toString(),
          'name': song['name'].toString(),
          'author': song['author'].toString(),
        }).toList();
        // Aquí podrías actualizar _totalPages si la API lo proporciona
        _totalPages = 2; // O ajusta esto según el valor real de tu API
      });
    } catch (e) {
      print('Error al obtener las canciones: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _nextPage() {
    if (_currentPage < _totalPages) {
      setState(() {
        _currentPage++;
      });
      _fetchSongs();
    }
  }

  void _previousPage() {
    if (_currentPage > 1) {
      setState(() {
        _currentPage--;
      });
      _fetchSongs();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Container(
            color: const Color(0xFF373535),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Bienvenido',
                    style: GoogleFonts.raleway(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        width: 350,
                        height: 20,
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          'Canciones',
                          style: GoogleFonts.raleway(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                if (_isLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  ListCard(songs: _songs),  // Usa el componente ListCard
                NavigationButtons(
                  currentPage: _currentPage,
                  totalPages: _totalPages,
                  onPrevious: _previousPage,
                  onNext: _nextPage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

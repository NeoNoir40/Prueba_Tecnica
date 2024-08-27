import 'package:flutter/material.dart';
import 'package:prueba_tecnica/api/api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//Widgets
import '../widgets/song_title.dart';
import '../widgets/widget_song_info.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  Map<String, dynamic>? songDetails;
  bool _isLoading = true;
  YoutubePlayerController? _youtubePlayerController;
  bool _videoAvailable = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchSongDetails();
    });
  }

  Future<void> _fetchSongDetails() async {
    final String songId =
        ModalRoute.of(context)?.settings.arguments as String? ?? '0';

    try {
      final details = await ApiService.fetchSongsDataDetail((songId));
      setState(() {
        songDetails = details;
        _isLoading = false;

        if (songDetails!['path_video'] != null &&
            songDetails!['path_video'].isNotEmpty) {
          _videoAvailable = true;
          _youtubePlayerController = YoutubePlayerController(
            initialVideoId:
                YoutubePlayer.convertUrlToId(songDetails!['path_video'])!,
            flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
          );
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Error al cargar los detalles de la canción: $e')),
      );
    }
  }

  @override
  void dispose() {
    _youtubePlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : songDetails != null
                ? Container(
                    color: const Color(0xFF373535),
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: SongTitle(songDetails: songDetails),
                          ),
                          if (_videoAvailable)
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: YoutubePlayer(
                                controller: _youtubePlayerController!,
                                showVideoProgressIndicator: true,
                              ),
                            )
                          else
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(40),
                              width: 250,
                              height: 200,
                              decoration: BoxDecoration(
                                color: const Color(0xFF484545),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                'Video no disponible',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          SongInfo(songDetails: songDetails),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child:
                        Text('No se encontraron detalles para esta canción.')),
      ),
    );
  }
}

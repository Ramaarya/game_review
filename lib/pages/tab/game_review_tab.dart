import 'package:flutter/material.dart';
import 'dart:convert';

//menggunakan package http untuk mengambil data
import 'package:http/http.dart' as http;

// import halaman detial
import '../detail_game.dart';

class GameReviewTab extends StatefulWidget {
  const GameReviewTab({super.key});

  @override
  State<GameReviewTab> createState() => _GameReviewTabState();
}

class _GameReviewTabState extends State<GameReviewTab> {
  int pageUrl = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Game Review Page  - ${pageUrl.toString()}"),
        elevation: 0.0,
        actions: [
          // menurunkan page APi
          IconButton(
            onPressed: () {
              setState(() {
                if (pageUrl > 1) {
                  pageUrl--;
                }
              });
            },
            icon: Icon(Icons.navigate_before),
          ),

          // Manikan halamnan page APi
          IconButton(
            onPressed: () {
              setState(() {
                if (pageUrl < 5) {
                  pageUrl++;
                }
              });
            },
            icon: Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _fetchGameReview(pageUrl),
        builder: (context, snapshot) {
          // pwngkonsian jika data berhasil di ambil
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length - 1,
              itemBuilder: (context, posisi) {
                int index = posisi + 1;
                return InkWell(
                  onTap: () {
                    if (snapshot.data![index]['desc'] == null) {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return const AlertDialog(
                              content: Text('Content Belum tersedia saat ini'),
                            );
                          });
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailGamePage(
                              title: snapshot.data![index]['title'],
                              imageUrl: snapshot.data![index]['thumb'],
                              desc: snapshot.data![index]['desc'],
                              author: snapshot.data![index]['author'],
                              time: snapshot.data![index]['time'],
                            );
                          },
                        ),
                      );
                    }
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          snapshot.data![index]['thumb'],
                        ),
                      ),
                    ),
                    title: Text(
                      snapshot.data![index]['title'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      snapshot.data![index]['author'],
                    ),
                  ),
                );
              },
            );
          } else {
            // ketika data gagal di ambil /  sedang diambil
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

// fungsi mengambil data dari APi
Future<List<dynamic>> _fetchGameReview(int halaman) async {
  var result = await http.get(Uri.parse(
      'https://the-lazy-media-api.vercel.app/api/games/review?page=$halaman'));
  var response = json.decode(result.body);
  print(halaman);
  return response;
}

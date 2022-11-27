import 'package:flutter/material.dart';
import 'dart:convert';

//menggunakan package http untuk mengambil data
import 'package:http/http.dart' as http;

// import halaman detaal
import '../detail_game.dart';

class PCGamesTab extends StatelessWidget {
  const PCGamesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('PC Games'),
        elevation: 0.0,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _fetchdDataGame(),
        builder: (context, snapshot) {
          // pwngkonsian jika data berhasil di ambil
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailGamePage(
                            title: snapshot.data![index]['title'],
                            imageUrl: snapshot.data![index]['thumbnail'],
                            desc: snapshot.data![index]['publisher'],
                            author: snapshot.data![index]['developer'],
                            time: snapshot.data![index]['platform'],
                          );
                        },
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        '${snapshot.data![index]['thumbnail']}',
                      ),
                    ),
                  ),
                  title: Text('${snapshot.data![index]['title']}'),
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
Future<List<dynamic>> _fetchdDataGame() async {
  var result =
      await http.get(Uri.parse('https://www.freetogame.com/api/games'));
  var response = json.decode(result.body);
  return response;
}

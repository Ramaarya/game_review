import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../detail_kelompok.dart';

class KelompokTab extends StatefulWidget {
  const KelompokTab({super.key});

  @override
  State<KelompokTab> createState() => _KelompokTabState();
}

class _KelompokTabState extends State<KelompokTab> {
  // menampung data json offline
  List _anggota = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/kelompok.json');
    final data = json.decode(response);
    setState(() {
      _anggota = data['mahasiswa'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: const Text('Tim seperjuangan Praktikum'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            _anggota.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _anggota.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Card(
                            key: ValueKey(_anggota[index]["id"]),
                            margin: const EdgeInsets.all(10),
                            color: Colors.redAccent.shade100,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailKelompokPage(
                                    name: _anggota[index]["name"],
                                    nim: _anggota[index]["nim"],
                                    desc: _anggota[index]["desc"],
                                  );
                                }));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: Text(_anggota[index]["id"]),
                                ),
                                title: Text(_anggota[index]["name"]),
                                subtitle: Text(_anggota[index]["nim"]),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
              ),
              onPressed: readJson,
              child: const Text('Lihat data'),
            ),
          ],
        ),
      ),
    );
  }
}

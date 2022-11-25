import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../detail_kelompok.dart';

class KelompokTab extends StatefulWidget {
  const KelompokTab({super.key});

  @override
  State<KelompokTab> createState() => _KelompokTabState();
}

class _KelompokTabState extends State<KelompokTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: const Text('Tim seperjuangan Praktikum'),
      ),
      body: FutureBuilder(
        future: _dataKelompok(),
        builder: (context, snapshoot) {
          if (snapshoot.hasData) {
            return ListView.builder(
                itemCount: snapshoot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailKelompokPage(
                          name: snapshoot.data![index]['name'],
                          nim: snapshoot.data![index]['nim'],
                          desc: snapshoot.data![index]['desc'],
                          bidang: snapshoot.data![index]['bidang'],
                        );
                      }));
                    },
                    leading: CircleAvatar(
                      child: Text(snapshoot.data![index]['id']),
                    ),
                    title: Text(snapshoot.data![index]['name']),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Future<List<dynamic>> _dataKelompok() async {
  var response =
      await http.get(Uri.parse('https://api.npoint.io/ba3cfefd41a46d012d6d'));
  if (response.statusCode == 200) {
    var data = json.decode(response.body)['mahasiswa'];
    return data;
  } else {
    throw Exception('Failed to Load');
  }
}

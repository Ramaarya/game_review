import 'package:flutter/material.dart';

class AboutMeTab extends StatefulWidget {
  const AboutMeTab({super.key});

  @override
  State<AboutMeTab> createState() => _AboutMeTabState();
}

class _AboutMeTabState extends State<AboutMeTab> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.redAccent,
        title: const Text("About Developer"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset('assets/thomas.jpg'),
              ),
              radius: 80,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Andra Putra Nurrafi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: screenWidth,
                  child: Row(
                    children: const [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Text('Nim'),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 3,
                        child: Text(':  21120120130090'),
                      ),
                    ],
                  ),
                ),
                // bagian alamat
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: screenWidth,
                  child: Row(
                    children: const [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Text('Alamat'),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 3,
                        child: Text(
                          ': Jalan Manalagi II Semarang',
                        ),
                      ),
                    ],
                  ),
                ),
                // bagian emial
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: screenWidth,
                  child: Row(
                    children: const [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Text('Email'),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 3,
                        child: Text(':  andraput988@gmail.com'),
                      ),
                    ],
                  ),
                ),
                // nomor hp
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: screenWidth,
                  child: Row(
                    children: const [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Text('Nomor Telp'),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 3,
                        child: Text(':  0895358959424'),
                      ),
                    ],
                  ),
                ),
                // Waifu
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: screenWidth,
                  child: Row(
                    children: const [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Text('Waifu'),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 3,
                        child: Text(':  Kobo'),
                      ),
                    ],
                  ),
                ),
                // nomor Ultah
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: screenWidth,
                  child: Row(
                    children: const [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Text('Ulang Tahun'),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 3,
                        child: Text(': 17 November'),
                      ),
                    ],
                  ),
                ),
                // nomor hp
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: screenWidth,
                  child: Row(
                    children: const [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Text('Kerjaan'),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 3,
                        child: Text(':  Berkerja di Kodingworks'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

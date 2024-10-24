import 'package:flutter/material.dart';
import 'package:studi_kasus_kuliner/model/makanan.dart';

class DetailScreen extends StatelessWidget {
  final Makanan makanan;
  DetailScreen({required this.makanan});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(makanan: makanan);
        } else {
          return DetailMobilePage(makanan: makanan);
        }
      },
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final Makanan makanan;

  const DetailMobilePage({required this.makanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                    width: double.infinity,
                    height: 300,
                    child: Image.asset(
                      makanan.thumbnail,
                      fit: BoxFit.cover,
                    )),
                SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  })),
                          FavoriteButton(),
                        ],
                      )),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                makanan.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.accessibility_new_sharp),
                      Text("Higienis"),
                      SizedBox(height: 8.0),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.eco_sharp),
                      Text("Menyehatkan"),
                      SizedBox(
                        height: 8.0,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.monetization_on),
                      Text(makanan.price),
                      SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                makanan.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: makanan.images.map((img) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(img),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                "Bahan-bahan",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: makanan.bahan.map((bhn) {
                  return Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        margin: EdgeInsets.only(right: 25),
                        child: Image.asset(bhn.image),
                      ),
                      Text(
                        "${bhn.name}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
                      )
                    ],
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class DetailWebPage extends StatelessWidget {
  final Makanan makanan;
  const DetailWebPage({required this.makanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: Container(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kuliner Nusantara',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Image.asset(makanan.thumbnail),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Scrollbar(
                            thumbVisibility: true,
                            child: Container(
                                height: 150,
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: makanan.images.map((img) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(img),
                                      ),
                                    );
                                  }).toList(),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                child: Text(
                                  makanan.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.accessibility_new_sharp),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        "Higienis",
                                      )
                                    ],
                                  ),
                                  FavoriteButton(),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.eco_sharp),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text("Menyehatkan")
                                ],
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    makanan.price,
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  makanan.description,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:studi_kasus_kuliner/detail_screen.dart';
import 'package:studi_kasus_kuliner/model/makanan.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuliner Nusantara'),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return MakananList();
        } else if (constraints.maxWidth <= 1200) {
          return MakananGrid(gridCount: 4);
        } else {
          return MakananGrid(gridCount: 6);
        }
      }),
    );
  }
}

class MakananList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Makanan daftarMakanan = listMakanan[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(
                makanan: daftarMakanan,
              );
            }));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    child: Image.asset(
                      daftarMakanan.thumbnail,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          daftarMakanan.name,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("${daftarMakanan.description}"),
                        Text(
                          "${daftarMakanan.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: listMakanan.length,
    );
  }
}

class MakananGrid extends StatelessWidget {
  final int gridCount;
  MakananGrid({required this.gridCount});
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: listMakanan.map((daftarMakanan) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(makanan: daftarMakanan);
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Image.asset(
                      daftarMakanan.thumbnail,
                      fit: BoxFit.cover,
                    )),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        daftarMakanan.name,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        "${daftarMakanan.description}",
                      ),
                    ),
                    Text(
                      "${daftarMakanan.price}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

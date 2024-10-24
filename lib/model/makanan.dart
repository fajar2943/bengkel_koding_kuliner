import 'package:studi_kasus_kuliner/model/bahan.dart';

class Makanan {
  String name;
  String description;
  String price;
  String thumbnail;
  List<String> images;
  List<Bahan> bahan;

  Makanan({
    required this.name,
    required this.description,
    required this.price,
    required this.thumbnail,
    required this.images,
    required this.bahan,
  });
}

var listMakanan = [
  Makanan(
      name: 'Bubur',
      description: 'Bubur ayam enak',
      price: 'Rp 25000',
      thumbnail: 'assets/bubur.jpg',
      images: [
        'assets/bubur1.jpg',
        'assets/bubur2.jpg',
        'assets/bubur3.jpg',
      ],
      bahan: [
        Bahan(name: "Ayam", image: "assets/bahan/ayam.png"),
        Bahan(name: "Kecap", image: "assets/bahan/kecap.png"),
        Bahan(name: "Bawang", image: "assets/bahan/bawang.png"),
      ]),
  Makanan(
      name: 'Soto',
      description: 'Soto kuah segar bingitzzzz!!!',
      price: 'Rp 20000',
      thumbnail: 'assets/soto.jpg',
      images: [
        'assets/soto1.jpg',
        'assets/soto2.jpg',
        'assets/soto3.jpg',
      ],
      bahan: [
        Bahan(name: "Cuka", image: "assets/bahan/cuka.png"),
        Bahan(name: "Ayam", image: "assets/bahan/ayam.png"),
        Bahan(name: "Daun Jeruk", image: "assets/bahan/daunJeruk.png"),
      ]),
  Makanan(
      name: 'Pecel',
      description: 'Pecel Sayur, ramban langsung dari kebun.',
      price: 'Free',
      thumbnail: 'assets/pecel.jpg',
      images: [
        'assets/pecel1.jpg',
        'assets/pecel2.jpg',
        'assets/pecel3.jpg',
      ],
      bahan: [
        Bahan(name: "Sayur", image: "assets/bahan/sayur.png"),
        Bahan(name: "Tahu", image: "assets/bahan/tahu.png"),
        Bahan(name: "Tomat", image: "assets/bahan/tomat.png"),
      ]),
];

import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class detailScreen extends StatefulWidget {
  final data;
  const detailScreen({Key? key, required this.data}) : super(key: key);

  @override
  _detailScreenState createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  var _selectedTab = _SelectedTab.detailScreen;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  late String harga, lokasi, warna, tanggal, km, tahun, image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List data = widget.data;

    tahun = data[0].toString();
    harga = data[1].toString();
    tanggal = data[2].toString();
    warna = data[3].toString();
    km = data[4].toString();
    lokasi = data[5].toString();
    image = data[6].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toyota Innova 2.5V AT"),
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 147, 126, 0),
      ),
      backgroundColor: Colors.white,
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[100],
                ),
                height: 50,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.wallet_rounded,
                            color: Colors.green,
                          ),
                          Text("Rp. $harga.000.000",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.pin_drop,
                            color: Colors.red,
                          ),
                          Text("$lokasi",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: 250,
                // width: 400,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[100],
                ),
                height: 150,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Deskripsi Produk",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Warna : $warna",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Tanggal Transaksi : $tanggal",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("KM : $km",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Tahun : $tahun",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          backgroundColor: Colors.grey[200],
          margin: const EdgeInsets.only(left: 10, right: 10),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          unselectedItemColor: Colors.grey[300],
          // enableFloatingNavBar: false,
          onTap: _handleIndexChanged,
          items: [
            /// detailScreen
            DotNavigationBarItem(
              icon: Row(
                children: const [
                  Icon(Icons.shopping_cart_outlined),
                  Text("Add Wishlist")
                ],
              ),
              selectedColor: const Color.fromARGB(255, 0, 147, 61),
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Row(
                children: const [Icon(Icons.whatsapp), Text("Order Now")],
              ),
              selectedColor: const Color.fromARGB(255, 0, 147, 61),
            ),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { detailScreen, favorite, search, person }

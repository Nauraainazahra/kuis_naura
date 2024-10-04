import 'package:flutter/material.dart';
import 'pemesanan_page.dart';  // Pastikan untuk import PemesananPage

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> hotels = [
    {
      'name': 'Blue Lagoon',
      'price': 500000,
      'image': 'https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg',
    },
    {
      'name': 'Sunset Inn',
      'price': 450000,
      'image': 'https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg',
    },
    {
      'name': 'Mountain View',
      'price': 550000,
      'image': 'https://raw.githubusercontent. com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg',
    },
    {
      'name': 'Seaside Resort',
      'price': 600000,
      'image': 'https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg',
    },
    {
      'name': 'Tropical Haven',
      'price': 400000,
      'image': 'https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg',
    },
    {
      'name': 'Forest Retreat',
      'price': 520000,
      'image': 'https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg',
    },
    {
      'name': 'City Lights',
      'price': 480000,
      'image': 'https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg',
    },
    {
      'name': 'Coastal Escape',
      'price': 560000,
      'image': 'https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg',
    },
    {
      'name': 'Luxury Mansion',
      'price': 750000,
      'image': 'https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg',
    },
    {
      'name': 'Mountain Lodge',
      'price': 530000,
      'image': 'https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  'https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/BLUE%20DOORZ.png',
                  width: 40,
                ),
                const SizedBox(width: 10),
                const Text('Welcome to Blue Doorz!'),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: hotels.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Dua hotel per baris
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final hotel = hotels[index];
            return HotelCard(hotel: hotel);
          },
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Image.network(hotel['image'], fit: BoxFit.cover, height: 100),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  hotel['name'],
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'Rp ${hotel['price']}/night',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Koneksi ke halaman Pemesanan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PemesananPage(
                          productName: hotel['name'],  // Kirimkan nama produk
                        ),
                      ),
                    );
                  },
                  child: const Text('Book Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HomePage()));
}

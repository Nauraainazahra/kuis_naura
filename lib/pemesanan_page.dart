import 'package:flutter/material.dart';
import 'pembayaran_page.dart'; // Pastikan import halaman pembayaran

class PemesananPage extends StatefulWidget {
  final String productName;

  const PemesananPage({super.key, required this.productName});

  @override
  State<PemesananPage> createState() => _PemesananPageState();
}

class _PemesananPageState extends State<PemesananPage> {
  final String productImageUrl = 'https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/main/hotel.jpg';
  final String productPrice = 'Rp 500.000/night';
  String _fullname = "";
  String _email = "";
  String _totalroom = "";
  String _totalnight = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  productImageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text("Gambar tidak dapat dimuat");
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.productName,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Price: $productPrice',
                style: const TextStyle(fontSize: 20, color: Colors.redAccent),
              ),
              const SizedBox(height: 20),
              const Text(
                "Booking Information",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildForm(),
              const SizedBox(height: 20),
              _buildButtonSubmit(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formInput({
    required String hint,
    required String label,
    required Function(String value) setStateInput,
    int maxLines = 1,
  }) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
      onChanged: setStateInput,
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        const SizedBox(height: 12),
        _formInput(
          hint: "Input Full Name",
          label: "Full Name *",
          setStateInput: (value) {
            setState(() {
              _fullname = value;
            });
          },
        ),
        const SizedBox(height: 12),
        _formInput(
          hint: "Input Email",
          label: "Email *",
          setStateInput: (value) {
            setState(() {
              _email = value;
            });
          },
        ),
        const SizedBox(height: 12),
        _formInput(
          hint: "Input total room",
          label: "Total Room *",
          setStateInput: (value) {
            setState(() {
              _totalroom = value;
            });
          },
        ),
        const SizedBox(height: 12),
        _formInput(
          hint: "Input total night",
          label: "Total Night *",
          setStateInput: (value) {
            setState(() {
              _totalnight = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildButtonSubmit() {
    return ElevatedButton(
      onPressed: () {
        if (_fullname.isEmpty || _email.isEmpty || _totalroom.isEmpty || _totalnight.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("*Data tidak boleh kosong")),
          );
        } else {
          try {
            final int totalRoom = int.parse(_totalroom);
            final int totalNight = int.parse(_totalnight);
            final int totalPrice = 500000 * totalRoom * totalNight;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PembayaranPage(
                  fullname: _fullname,
                  email: _email,
                  totalRoom: _totalroom,
                  totalNight: _totalnight,
                  totalPrice: totalPrice,
                ),
              ),
            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Input tidak valid")),
            );
          }
        }
      },
      child: const Text('Submit'),
    );
  }
}

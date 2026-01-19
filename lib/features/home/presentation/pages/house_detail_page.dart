import 'package:flutter/material.dart';
import '../../data/models/house_model.dart';

class HouseDetailPage extends StatelessWidget {
  final House house;
  static const String baseUrl = "http://10.0.2.2:8000";

  const HouseDetailPage({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(house.titre),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              baseUrl+house.image,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    house.titre,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 20, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(house.localisation, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "\$${house.prix} / mois",
                    style: const TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.bed, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text("${house.chambres} chambres"),
                      const SizedBox(width: 16),
                      const Icon(Icons.bathtub, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text("${house.douche_toilettes} salles de bain"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Cette maison moderne est idéale pour une famille. Profitez d'espaces lumineux, d'une cuisine équipée et d'un jardin agréable.",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action future : contacter le propriétaire ou réserver
                      },
                      child: const Text("Contacter le propriétaire"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

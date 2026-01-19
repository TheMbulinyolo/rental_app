import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home_controller.dart';
import '../widgets/house_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomeController>().loadHouses();
  }

  void _onSearchChanged(String query) {
    context.read<HomeController>().loadHouses(search: query);
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Maisons en location"),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://picsum.photos/200"), // photo utilisateur
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: "Rechercher une maison...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : controller.error != null
              ? Center(child: Text(controller.error!))
              : RefreshIndicator(
                  onRefresh: () async {
                    await controller.loadHouses(
                        search: searchController.text.isEmpty
                            ? null
                            : searchController.text);
                  },
                  child: controller.houses.isEmpty
                      ? const Center(
                          child: Text(
                            "Aucune maison trouvée",
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: controller.houses.length,
                          itemBuilder: (context, index) {
                            return HouseCard(house: controller.houses[index]);
                          },
                        ),
                ),
    );
  }
}

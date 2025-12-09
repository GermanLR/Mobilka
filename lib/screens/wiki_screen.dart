import 'package:flutter/material.dart';

class WikiScreen extends StatefulWidget {
  const WikiScreen({super.key});

  @override
  State<WikiScreen> createState() => _WikiScreenState();
}

class _WikiScreenState extends State<WikiScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _articles = [
    "Sonic the Hedgehog",
    "Miles 'Tails' Prower",
    "Knuckles the Echidna",
    "Dr. Eggman",
    "Shadow the Hedgehog",
    "Chaos Emeralds",
    "Green Hill Zone",
    "Sonic.EXE Mythology",
  ];

  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredArticles = _articles
        .where((article) =>
            article.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wiki Zone",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 3,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Поисковая строка
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Поиск статей...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Список статей
            Expanded(
              child: ListView.builder(
                itemCount: filteredArticles.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        filteredArticles[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

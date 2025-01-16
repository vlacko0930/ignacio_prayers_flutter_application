import 'package:flutter/material.dart';

import '../data/prayer.dart';
import '../data_handlers/data_manager.dart';
import '../prayer/prayer_description_page.dart';

class PrayersPage extends StatelessWidget {
  const PrayersPage({
    super.key,
    required this.title,
    required this.prayers,
    required this.dataManager,
  });
  final List<Prayer> prayers;
  final String title;
  final DataManager dataManager;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: prayers.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 350,
                  mainAxisSpacing: 4,
                  mainAxisExtent: 200,
                  crossAxisSpacing: 4,
                ),
                itemCount: prayers.length,
                itemBuilder: (context, index) {
                  final prayer = prayers[index];
                  return Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrayerDescriptionPage(
                              prayer: prayer,
                              dataManager: dataManager,
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          // Background Image
                          Positioned.fill(
                            child: FutureBuilder<dynamic>(
                              future: dataManager.imagesManager
                                  .getFile(prayer.image),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError ||
                                    !snapshot.hasData) {
                                  // !snapshot.data!.existsSync()
                                  return const Center(
                                    child: Icon(
                                      Icons.broken_image,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  );
                                } else {
                                  return Image.file(
                                    snapshot.data!,
                                    fit: BoxFit.cover,
                                  );
                                }
                              },
                            ),
                          ),
                          // Overlay for Title
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              color: Colors.black54,
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                prayer.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      );
}

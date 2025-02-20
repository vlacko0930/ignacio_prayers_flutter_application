import 'package:flutter/material.dart';

import '../data/prayer_group.dart';
import '../prayer/prayer_image.dart';
import '../routes.dart';

class PrayersPage extends StatelessWidget {
  const PrayersPage({
    super.key,
    required this.group,
  });

  final PrayerGroup group;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(group.title)),
        body: group.prayers.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 350,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 200,
                  crossAxisSpacing: 8,
                ),
                padding: const EdgeInsets.all(8),
                itemCount: group.prayers.length,
                itemBuilder: (context, index) {
                  final prayer = group.prayers[index];
                  return Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.prayerDescription(prayer),
                        arguments: prayer,
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: PrayerImage(name: prayer.image),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              color: Colors.black54,
                              padding: const EdgeInsets.all(8),
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

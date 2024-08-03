import 'package:flutter/material.dart';
import 'package:mobile_app/provider/GalleryData.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemCount: context.watch<GalleryData>().cats.length,
            itemBuilder: (context, index) {
              return Image.network(
                context.watch<GalleryData>().cats[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }

}
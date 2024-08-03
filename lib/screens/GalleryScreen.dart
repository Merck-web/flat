import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/cubit/GalleryCubit.dart';
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
    return BlocBuilder<GalleryCubit, GalleryState>(
      builder: (context, state) {
        if (state is GalleryLoading) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        else if (state is GalleryLoaded) {
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
                  itemCount: state.cats.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      state.cats[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          );
        }
        else if (state is GalleryError) {
          return Scaffold(
            body: Center(child: Text(state.message)),
          );
        }
        else {
          return Scaffold(
            body: Center(child: Text('Something went wrong')),
          );
        }
      },
    );
  }
}
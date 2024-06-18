import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_app/providers/user_places.dart';
import 'package:native_app/screens/add_place.dart';
import 'package:native_app/widgets/places_list.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   final userPlaces = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddPlaceScreen(),
                ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: PlacesList(
          places: 
            userPlaces
          ,
        ),
      ),
    );
  }
}

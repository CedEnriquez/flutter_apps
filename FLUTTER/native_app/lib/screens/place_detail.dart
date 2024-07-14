import 'package:flutter/material.dart';
import 'package:native_app/models/place.dart';
import 'package:native_app/screens/map.dart';

class PlaceDetail extends StatelessWidget {
  const PlaceDetail({super.key, required this.place});

  final Place place;

  String get locationImage {
    final lat = place.location.latitude;
    final long = place.location.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$long=&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:A%7C$lat,$long&key=AIzaSyC7KgoaWxV08eowa9aRqcVxcNjXkDAqw3I';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          place.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  MapScreen(
                          location: place.location,
                          isSelecting: false,
                        
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(locationImage),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.transparent,
                        Colors.black54,
                      ], begin: Alignment.center, end: Alignment.bottomCenter),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: Text(place.location.address,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            )),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

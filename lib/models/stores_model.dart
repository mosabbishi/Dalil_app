import 'package:google_maps_flutter/google_maps_flutter.dart';

class Stores {
  final String? name;
  final String? type;
  final String? address;
  final LatLng? location;
  final String? desc;
  final String? headerImage;
  final String? gallery;
  final String? reviews;

  Stores(
    this.name,
    this.type,
    this.address,
    this.location,
    this.desc,
    this.headerImage,
    this.gallery,
    this.reviews,
  );

  // Stores.fromJson();

}

final List<Stores> stores = [
  Stores(
    'name',
    'type',
    'address',
    LatLng(21.3909600, 39.8540100),
    'desc',
    'headerImage',
    'gallery',
    'reviews',
  ),
  Stores(
    'name',
    'type',
    'address',
    LatLng(21.3409600, 39.8540100),
    'desc',
    'headerImage',
    'gallery',
    'reviews',
  ),
  Stores(
    'name',
    'type',
    'address',
    LatLng(21.4409600, 38.2540100),
    'desc',
    'headerImage',
    'gallery',
    'reviews',
  ),
  Stores(
    'name',
    'type',
    'address',
    LatLng(21.4409600, 37.2540100),
    'desc',
    'headerImage',
    'gallery',
    'reviews',
  ),
  Stores(
    'name',
    'type',
    'address',
    LatLng(21.4409600, 36.2540100),
    'desc',
    'headerImage',
    'gallery',
    'reviews',
  ),
  Stores(
    'name',
    'type',
    'address',
    LatLng(21.4409600, 36.2540100),
    'desc',
    'headerImage',
    'gallery',
    'reviews',
  ),
];


// 

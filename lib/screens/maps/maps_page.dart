import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class VetLocationScreen extends StatefulWidget {
  const VetLocationScreen({super.key});

  @override
  State<VetLocationScreen> createState() => _VetLocationScreenState();
}

class _VetLocationScreenState extends State<VetLocationScreen> {
  final TextEditingController _searchController = TextEditingController();
  MapController mapController = MapController();
  Position? currentPosition;
  List<Marker> markers = [];

  static const LatLng defaultLocation = LatLng(26.6667, 87.2667);

  final List<Map<String, dynamic>> vetLocations = [
    {
      'id': 'vet1',
      'name': 'Pet Care Clinic',
      'latitude': 26.6667,
      'longitude': 87.2667,
    },
    {
      'id': 'vet2',
      'name': 'Animal Hospital',
      'latitude': 26.6657,
      'longitude': 87.2687,
    },
  ];

  @override
  void initState() {
    super.initState();
    _checkPermissionAndFetchLocation();
    _addVetMarkers();
  }

  void _addVetMarkers() {
    for (final location in vetLocations) {
      markers.add(
        Marker(
          point: LatLng(
            location['latitude'],
            location['longitude'],
          ),
          width: 80,
          height: 80,
          child: Tooltip(
            message: location['name'],
            child: const Icon(
              Icons.location_on,
              color: Colors.red,
              size: 40,
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _checkPermissionAndFetchLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showLocationError('Location services are disabled. Please enable them.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showLocationError('Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showLocationError('Location permissions are permanently denied.');
      return;
    }

    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentPosition = position;
        markers.add(
          Marker(
            point: LatLng(position.latitude, position.longitude),
            width: 80,
            height: 80,
            child: const Tooltip(
              message: 'Your Location',
              child: Icon(
                Icons.my_location,
                color: Colors.blue,
                size: 40,
              ),
            ),
          ),
        );
      });

      mapController.move(
        LatLng(position.latitude, position.longitude),
        15.0,
      );
    } catch (e) {
      _showLocationError('Error getting location: $e');
    }
  }

  void _showLocationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE1F0),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: currentPosition != null
                  ? LatLng(
                      currentPosition!.latitude, currentPosition!.longitude)
                  : defaultLocation,
              initialZoom: 14,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(markers: markers),
            ],
          ),
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for veterinary clinics...',
                hintStyle: GoogleFonts.lato(),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

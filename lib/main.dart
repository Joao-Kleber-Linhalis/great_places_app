import 'package:flutter/material.dart';
import 'package:great_places_app/screens/place_form_screen.dart';
import 'package:great_places_app/screens/places_list_screen.dart';
import 'package:great_places_app/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: ThemeData(
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.amber),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.indigo,
          secondary: Colors.amber,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: false,
      ),
      home: const PlacesListScreen(),
      routes: {
        AppRoutes.PLACE_FORM: (context) => PlaceFormScreen(),
      },
    );
  }
}



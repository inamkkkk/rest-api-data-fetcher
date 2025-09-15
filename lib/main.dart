import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/country_list_screen.dart';
import 'services/api_service.dart';
import 'models/country.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountryListProvider(),
      child: MaterialApp(
        title: 'Country List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CountryListScreen(),
      ),
    );
  }
}

class CountryListProvider extends ChangeNotifier {
  List<Country> _countries = [];
  bool _isLoading = false;
  String? _error;

  List<Country> get countries => _countries;
  bool get isLoading => _isLoading;
  String? get error => _error;

  CountryListProvider() {
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _countries = await ApiService.fetchCountries();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
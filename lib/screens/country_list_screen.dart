import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/country.dart';
import '../main.dart';

class CountryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryListProvider>(context);

    if (countryProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Countries')),
        body: Center(child: CircularProgressIndicator()),
      );
    } else if (countryProvider.error != null) {
      return Scaffold(
        appBar: AppBar(title: Text('Countries')),
        body: Center(child: Text('Error: ${countryProvider.error}')),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Text('Countries')),
        body: ListView.builder(
          itemCount: countryProvider.countries.length,
          itemBuilder: (context, index) {
            final country = countryProvider.countries[index];
            return ListTile(
              title: Text(country.name.common),
              subtitle: Text(country.capital?.join(', ') ?? 'No Capital'),
            );
          },
        ),
      );
    }
  }
}
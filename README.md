# Flutter REST API Data Fetcher

A Flutter project demonstrating fetching and displaying data from a public REST API.

## Features

*   Fetches data from a public API using the `http` package.
*   Parses JSON data.
*   Displays the data in a list.
*   Uses Provider for state management.
*   Handles loading and error states.

## Getting Started

1.  Clone the repository.
2.  Run `flutter pub get` to install dependencies.
3.  Run `flutter run` to start the app.

## Dependencies

*   `http: ^0.13.3`
*   `provider: ^6.0.0`

## API Endpoint

The app uses the [https://restcountries.com/v3.1/all](https://restcountries.com/v3.1/all) endpoint to fetch a list of countries.  You can easily configure the API endpoint through the constant `apiEndpoint` in `lib/services/api_service.dart`.

## Folder Structure


lib/
  ├── main.dart
  ├── models
  │   └── country.dart
  ├── screens
  │   └── country_list_screen.dart
  └── services
      └── api_service.dart


## State Management

The app uses the Provider package for state management.  The `CountryListProvider` manages the list of countries and the loading/error states.

## Error Handling

The app includes basic error handling to display an error message if the API request fails.

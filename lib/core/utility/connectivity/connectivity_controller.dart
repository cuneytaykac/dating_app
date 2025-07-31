import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController extends ChangeNotifier {
  late final Connectivity connectivity;

  // Private constructor
  ConnectivityController._() {
    connectivity = Connectivity();
    connectivity.onConnectivityChanged.listen((event) {
      // ignore: unrelated_type_equality_checks
      if (event.contains(ConnectivityResult.none)) {
        triggerConnection(false);
      } else {
        triggerConnection(true);
      }
    });
    firstCheck(); // Initialize hasConnection
  }

  // Static instance
  static final ConnectivityController _instance = ConnectivityController._();

  // Factory constructor
  factory ConnectivityController() => _instance;

  bool? hasConnection = true;

  void triggerConnection(bool value) {
    if (value == hasConnection) return;
    hasConnection = value;
    log('hasConnection $hasConnection');
    notifyListeners();
  }

  // Renamed and ensured it returns List<ConnectivityResult>
  Future<List<ConnectivityResult>> getInitialConnectivityResults() async {
    try {
      return await connectivity.checkConnectivity();
    } catch (e) {
      log('Error fetching initial connectivity: $e');
      return [ConnectivityResult.none]; // Default to none on error
    }
  }

  Future<bool> checkConnection() async {
    try {
      final List<ConnectivityResult> result =
          await connectivity.checkConnectivity();
      if (result.contains(ConnectivityResult.none)) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> firstCheck() async {
    // Uses the new method to get List<ConnectivityResult>
    final initialResults = await getInitialConnectivityResults();
    if (initialResults.contains(ConnectivityResult.none)) {
      hasConnection = false;
    } else {
      hasConnection = true;
    }
    // notifyListeners(); // Only if hasConnection is directly watched by a UI element needing immediate update
  }

  // Modified stream to yield initial status
  Stream<List<ConnectivityResult>> get getConnectivityStream async* {
    yield await getInitialConnectivityResults(); // Yield initial current status
    yield* connectivity.onConnectivityChanged; // Then yield subsequent changes
  }
}

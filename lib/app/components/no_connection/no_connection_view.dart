import 'package:flutter/material.dart';

class NoConnectionView extends StatelessWidget {
  final VoidCallback? onRetry;

  const NoConnectionView({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA), // appGhostWhite
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.wifi_off_rounded,
                size: 100,
                color: Color(0xFF2C7FDE), // appBlue
              ),
              const SizedBox(height: 24),
              const Text(
                'İnternet Bağlantısı Yok',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF090A0A), // appVampireBlack
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Lütfen internet bağlantınızı kontrol edin ve tekrar deneyin.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF72777A), // appSonicSilver
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

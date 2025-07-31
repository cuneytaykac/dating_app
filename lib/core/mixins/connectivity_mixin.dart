import 'package:dating_app/core/utility/connectivity/connectivity_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin ConnectivityMixin<T extends StatefulWidget> on State<T> {
  ConnectivityController? _controller;

  ConnectivityController get currentConnection {
    _controller ??= context.read<ConnectivityController>();
    return _controller!;
  }

  @override
  void dispose() {
    _controller = null;
    super.dispose();
  }
}

mixin ConnectivityMixinStateless<T extends StatelessWidget> {
  ConnectivityController currentConnection(BuildContext context) =>
      context.read<ConnectivityController>();
}

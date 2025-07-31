import 'package:dating_app/core/results/view_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moon_extension/moon_extension.dart';

typedef CompletedWidget<T> = Widget Function(T);

class ResultStateBuilder<T, E extends Exception> extends StatelessWidget {
  final ViewState<T, E> resultState;
  final CompletedWidget<T> completed;
  const ResultStateBuilder({
    super.key,
    required this.resultState,
    required this.completed,
    Card Function(dynamic _, dynamic __)? empty,
  });

  @override
  Widget build(BuildContext context) {
    return resultState.when(
      idle: () {
        return Container();
      },
      pending: (widget) {
        return widget ??
            const Center(child: CupertinoActivityIndicator(color: Colors.blue));
      },
      completed: (data) {
        return completed(data);
      },
      failed: (error, textColor) {
        return Text(error.toString());
      },
      empty: (color, widget) {
        return widget ??
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: context.screenHeight(0.2)),
                  Text('Gösterilecek Sonuç Bulunamadı'),
                ],
              ),
            );
      },
    );
  }
}

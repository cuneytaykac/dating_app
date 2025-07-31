import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_state.freezed.dart';

@freezed
class ViewState<T, E extends Exception> with _$ViewState<T, E> {
  const ViewState._() : super();

  const factory ViewState.idle() = Idle;
  const factory ViewState.pending({Widget? widget}) = Pending;
  const factory ViewState.completed(T data) = Completed;
  const factory ViewState.failed(String? error, {Color? textColor}) = Failed;
  const factory ViewState.empty({Color? textColor, Widget? widget}) = Empty;

  T? get data {
    return whenOrNull(completed: ((data) => data));
  }
}

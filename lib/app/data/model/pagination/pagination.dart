import 'package:json_annotation/json_annotation.dart';

import '../../../../core/network/interfaces/base_network_model.dart';

part 'pagination.g.dart';

@JsonSerializable()
final class Pagination implements BaseNetworkModel<Pagination> {
  final int? totalCount;
  final int? perPage;
  final int? maxPage;
  final int? currentPage;

  Pagination({this.totalCount, this.perPage, this.maxPage, this.currentPage});

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationToJson(this);

  @override
  Pagination fromJson(Map<String, dynamic> json) {
    return Pagination.fromJson(json);
  }
}

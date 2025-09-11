import 'package:space_x_now_core/entities/query_response.dart';

class QueryResponseModel<T> extends QueryResponse<T> {
  const QueryResponseModel({
    required super.docs,
    required super.totalDocs,
    required super.limit,
    required super.totalPages,
    required super.page,
    required super.hasNextPage,
    required super.hasPrevPage,
    super.nextPage,
    super.prevPage,
  });

  factory QueryResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return QueryResponseModel<T>(
      docs: (json['docs'] as List)
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
      totalDocs: json['totalDocs'] as int,
      limit: json['limit'] as int,
      totalPages: json['totalPages'] as int,
      page: json['page'] as int,
      hasNextPage: json['hasNextPage'] as bool,
      hasPrevPage: json['hasPrevPage'] as bool,
      nextPage: json['nextPage'] as int?,
      prevPage: json['prevPage'] as int?,
    );
  }
}

import 'package:equatable/equatable.dart';

class QueryResponse<T> extends Equatable {
  final List<T> docs;
  final int totalDocs;
  final int limit;
  final int totalPages;
  final int page;
  final bool hasNextPage;
  final bool hasPrevPage;
  final int? nextPage;
  final int? prevPage;

  const QueryResponse({
    required this.docs,
    required this.totalDocs,
    required this.limit,
    required this.totalPages,
    required this.page,
    required this.hasNextPage,
    required this.hasPrevPage,
    this.nextPage,
    this.prevPage,
  });

  @override
  List<Object?> get props => [
        docs,
        totalDocs,
        limit,
        totalPages,
        page,
        hasNextPage,
        hasPrevPage,
        nextPage,
        prevPage,
      ];
}

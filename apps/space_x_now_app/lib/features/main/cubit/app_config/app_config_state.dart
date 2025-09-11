// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_config_cubit.dart';

enum AppConfigStatus { initial, loading, loaded, failed }

class AppConfigState extends Equatable {
  final AppConfigStatus status;
  final String locale;
  final Failure? failure;

  const AppConfigState({
    required this.status,
    required this.locale,
    this.failure,
  });

  @override
  List<Object?> get props => [status, failure];

  AppConfigState copyWith({
    AppConfigStatus? status,
    String? locale,
    Failure? failure,
  }) {
    return AppConfigState(
      status: status ?? this.status,
      locale: locale ?? this.locale,
      failure: failure ?? this.failure,
    );
  }
}

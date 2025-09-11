// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_cubit.dart';

enum SettingsStatus { initial, loading, loaded, failed }

class SettingsState extends Equatable {
  final SettingsStatus status;
  final String locale;
  final Failure? failure;

  const SettingsState({
    this.status = SettingsStatus.initial,
    this.locale = 'en',
    this.failure,
  });

  @override
  List<Object?> get props => [status, locale, failure];

  SettingsState copyWith({
    SettingsStatus? status,
    String? locale,
    Failure? failure,
  }) {
    return SettingsState(
      status: status ?? this.status,
      locale: locale ?? this.locale,
      failure: failure ?? this.failure,
    );
  }
}

part of 'main_cubit.dart';

class MainState extends Equatable {
  final int currentIndex;

  const MainState({
    required this.currentIndex,
  });

  @override
  List<Object> get props => [currentIndex];

  MainState copyWith({
    int? currentIndex,
  }) {
    return MainState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

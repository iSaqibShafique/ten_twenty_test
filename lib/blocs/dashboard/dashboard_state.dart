part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

final class DashboardInitial extends DashboardState {
  final int selectedIndex;

//! Default index = 1
  const DashboardInitial({this.selectedIndex = 1});

  @override
  List<Object> get props => [selectedIndex];

  DashboardInitial copyWith({
    int? selectedIndex,
  }) {
    return DashboardInitial(selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}

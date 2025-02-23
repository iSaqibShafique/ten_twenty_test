part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

final class UpdateBottomNavBarIndexEvent extends DashboardEvent {
  final int index;

  const UpdateBottomNavBarIndexEvent({required this.index});
}

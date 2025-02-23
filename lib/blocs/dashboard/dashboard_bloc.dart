import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardInitial()) {
    on<UpdateBottomNavBarIndexEvent>((event, emit) {
      final s = state as DashboardInitial;
      emit(s.copyWith(selectedIndex: event.index));
    });
    // on<DashboardEvent>((event, emit) {});
    // on<DashboardEvent>((event, emit) {});
    // on<DashboardEvent>((event, emit) {});
    // on<DashboardEvent>((event, emit) {});
  }
}

import 'package:bloc/bloc.dart';
import 'package:insight_report/screen/main/screen_state.dart';

import '../dashboard/dashboard_screen_state.dart';
import '../notification/notification_screen_state.dart';
import '../profile/profile_screen_state.dart';
import '../report/report_screen_state.dart';

class MainCubit extends Cubit<ScreenState> {
  MainCubit() : super(DashboardScreenState());

  void changeScreen(int index) {
    ScreenState? screenState;
    switch (index) {
      case 0:
        screenState = DashboardScreenState();
        break;
      case 1:
        screenState = ReportScreenState();
        break;
      case 2:
        break;
      case 3:
        screenState = NotificationScreenState();
        break;
      case 4:
        screenState = ProfileScreenState();
        break;
    }
    if (screenState != null && state != screenState) {
      print("change screen to: $screenState");
      emit(screenState);
    }
  }
}

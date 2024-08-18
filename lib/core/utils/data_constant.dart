import '../../routes/route_path.dart';

class AppConstantData {
  Map<String, String> pagesList = {
    "Recharge": RoutesName.recharge_screen,
    "NEA Bill": RoutesName.test_screen
  };

  List<String> rechargeForm = [
    "operatorName*",
    "Amount*",
    "Recharge Receiver Mobile Number*",
    "Individual Remarks",
    "Additional Parameter 1",
    "Additional Parameter 2",
    "Additional Parameter 3",
    "Additional Parameter 4",
    "Additional Parameter 5",
    "Additional Parameter 6",
    "Additional Parameter 7",
    "Additional Parameter 8",
    "Additional Parameter 9",
    "Additional Parameter 10"
  ];
}

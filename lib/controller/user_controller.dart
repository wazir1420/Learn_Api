import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:learnapi/models/user_model.dart';
import 'package:learnapi/services/api_service.dart';

class UserController extends GetxController {
  ApiService apiService = ApiService();
  List<UsersModel> userDataList = [];

  getData() async {
    var usersData = await apiService.getUsersData();
    print(usersData);
    userDataList = usersData;
    update();
  }
}

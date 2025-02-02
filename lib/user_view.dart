import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:learnapi/controller/user_controller.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  userController.getData();
                },
                child: Text('Show')),
            SizedBox(
              height: 30,
            ),
            GetBuilder<UserController>(builder: (context) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userController.userDataList.length,
                  itemBuilder: (context, sarmad) {
                    return Text(
                        '${userController.userDataList[sarmad].address!.street}');
                  });
            })
          ],
        ),
      ),
    );
  }
}

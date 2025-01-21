import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:learnapi/get_user.dart';
import 'package:learnapi/services/api_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: apiService.getUsersData(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return ListView.builder(
                itemCount: snapShot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GetUserView(id: snapShot.data[index]['id'])));
                    },
                    title: Text('${snapShot.data[index]['name']}'),
                    subtitle: Text('${snapShot.data[index]['id']}'),
                  );
                },
              );
            }
            return FadeShimmer(
              height: 50,
              width: 150,
              radius: 4,
              highlightColor: Colors.grey,
              baseColor: Colors.grey,
            );
          }),
    );
  }
}

import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:learnapi/services/api_service.dart';

class GetUserView extends StatefulWidget {
  int? id;
  GetUserView({super.key, this.id});

  @override
  State<GetUserView> createState() => _GetUserViewState();
}

class _GetUserViewState extends State<GetUserView> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.id}'),
        ),
        body: FutureBuilder(
            future: apiService.getUserById(widget.id),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return ListTile(
                  title: Text("${snapShot.data['name']}"),
                  subtitle: Text("${snapShot.data['email']}"),
                  trailing: Text("${snapShot.data['username']}"),
                );
              }
              return CircularProgressIndicator();
            }));
  }
}

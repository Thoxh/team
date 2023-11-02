import 'package:flutter/material.dart';

import 'api_service.dart';
import 'entity/registration_entity.dart';

class FeedbackList extends StatefulWidget {
  const FeedbackList({super.key});

  @override
  _FeedbackListState createState() => _FeedbackListState();
}

class _FeedbackListState extends State<FeedbackList> {
  late Future<List<RegistrationEntity>> feedbackList;

  @override
  void initState() {
    super.initState();
    feedbackList = ApiService().getFeedback();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RegistrationEntity>>(
      future: feedbackList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return Center(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var item = snapshot.data![index];
                return ListTile(
                  title: Text('${item.firstName} ${item.lastName}'),
                  subtitle:
                      Text(item.hasAccepted ? 'Accepted' : 'Not Accepted'),
                );
              },
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

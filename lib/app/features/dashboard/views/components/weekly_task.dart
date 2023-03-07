import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared_components/list_task_assigned.dart';
import '../../Models/client.dart';

class WeeklyTask extends StatelessWidget {
  const WeeklyTask({
    required this.data,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
    Key? key,
  }) : super(key: key);

  final Future<List<Comment>> data;
  final Function(int index, Comment data) onPressed;
  final Function(int index, Comment data) onPressedAssign;
  final Function(int index, Comment data) onPressedMember;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Comment>>(
        future: data,
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            List<Comment>? comments = snapshot.data;

            return Column(
                children: List.generate(
                  comments!.length, (index) =>
                    BuildListClients(data: comments[index], onPressed: () => {}, onPressedAssign: () => {}, onPressedMember: () => {},),
                  ),
                );

          } else if (snapshot.hasError) {
            return Text("AUCUNE COMMANDE TROUVEE");//"${snapshot.error}"
          }
          return Center(child: CircularProgressIndicator());
        },
    );


  }
}

import 'package:flutter/cupertino.dart';

import '../../../../shared_components/simple_user_profile.dart';

class Member extends StatelessWidget {
  const Member({
    required this.member,
    Key? key,
  }) : super(key: key);

  final List<String> member;
  final int maxDisplayPeople = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        (member.length > maxDisplayPeople) ? maxDisplayPeople : member.length,
        (index) => SimpleUserProfile(
          name: member[index],
          onPressed: () {

          },
        ),
      ).toList(),
    );
  }
}

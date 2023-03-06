import 'package:flutter/cupertino.dart';

import '../../../../shared_components/simple_selection_button.dart';

class TaskMenu extends StatelessWidget {
  const TaskMenu({
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  final Function(int index, String label) onSelected;

  @override
  Widget build(BuildContext context) {
    return SimpleSelectionButton(
      data: const [
        "Meilleurs clients",
        "Meilleurs produits",
        "Ventes par période",
      ],
      onSelected: onSelected,
    );
  }
}

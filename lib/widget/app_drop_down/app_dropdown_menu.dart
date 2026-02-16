import 'package:flutter/material.dart';
import 'package:tinnierenee12/utils/app_size.dart';

// ignore: must_be_immutable
class AppDropDownMenu extends StatelessWidget {
  final List<String> items;
  String selectedOption;

  AppDropDownMenu({
    super.key,
    required this.items,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showPopupMenu(context),
      child: Text('Show Pop-up Menu'),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final result = await showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          Offset(AppSize.size.width * 2, AppSize.size.width * 2),
          Offset(100, 100),
        ),
        Offset.zero & overlay.size,
      ),
      items: items.map((String item) {
        return PopupMenuItem<String>(value: item, child: Text(item));
      }).toList(),
    );

    if (result != null) {
      selectedOption = result;
    }
  }
}

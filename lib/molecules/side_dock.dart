import 'package:flutter/material.dart';
import '../atoms/icon_data_item.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class SideDock extends StatefulWidget {
  SideDock(
      {Key? key,
      required this.index,
      required this.selectIcon,
      required this.icons})
      : super(key: key);

  int index;
  final Function(int) selectIcon;
  final List<IconDataItem> icons;

  @override
  _SideDockState createState() => _SideDockState();
}

class _SideDockState extends State<SideDock> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IntrinsicHeight(
        child: BlurryContainer(
          color: Color.fromARGB(76, 40, 54, 209),
          width: 70.0,
          padding: const EdgeInsets.all(8),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          blur: 5,
          child: Column(
            children: widget.icons.map((item) {
              return IconItem(
                icon: item.icon,
                selected: widget.index == item.index,
                onTap: () => widget.selectIcon(item.index),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class IconItem extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const IconItem({
    Key? key,
    required this.icon,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: selected ? 70.0 : 50.0,
        height: selected ? 70.0 : 50.0,
        child: Icon(
          icon,
          color: selected
              ? Colors.white
              : const Color.fromARGB(179, 205, 205, 205),
          size: selected ? 50.0 : 30.0,
        ),
      ),
    );
  }
}

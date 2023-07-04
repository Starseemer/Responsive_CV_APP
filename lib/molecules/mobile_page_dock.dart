import 'package:flutter/material.dart';
import '../atoms/icon_data_item.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class PageDockMobile extends StatefulWidget {
  PageDockMobile({
    Key? key,
    required this.index,
    required this.page_count,
    required this.onTap,
  }) : super(key: key);

  int index;
  final int page_count;
  final Function(int) onTap;

  @override
  _PageDockMobileState createState() => _PageDockMobileState();
}

class _PageDockMobileState extends State<PageDockMobile> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: BlurryContainer(
        color: Color.fromARGB(76, 40, 54, 209),
        height: 30.0,
        //width: MediaQuery.of(context).size.width * 0.5,
        padding: const EdgeInsets.all(8),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        blur: 5,
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(widget.page_count, (i) => i).map((item) {
              return IconItem(
                selected: widget.index == item,
                onTap: () => widget.onTap(item),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class IconItem extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;
  const IconItem({
    Key? key,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: selected ? 20.0 : 10.0,
          height: selected ? 20.0 : 10.0,
          child: Icon(
            Icons.circle,
            color: Colors.white,
            size: selected ? 20.0 : 10.0,
          ),
        ),
      ),
    );
  }
}

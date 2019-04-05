import 'package:flutter/material.dart';
import 'package:flutter_floating_menu/floating_menu_callback.dart';
import 'package:flutter_floating_menu/floating_menu_item.dart';

class FloatingMenu extends StatefulWidget {
  final List<FloatingMenuItem> menuList;
  final preMenuIcon;
  final postMenuIcon;
  final Color btnBackgroundColor;
  final FloatingMenuCallback callback;

  const FloatingMenu(
      {Key key,
      @required this.menuList,
      this.preMenuIcon,
      this.postMenuIcon,
      this.btnBackgroundColor,
      @required this.callback})
      : super(key: key);

  @override
  _FloatingMenuState createState() => _FloatingMenuState();
}

class _FloatingMenuState extends State<FloatingMenu>
    with TickerProviderStateMixin {
  bool isFloatClicked = false;
  AnimationController controller;
  Animation<Offset> offset;
  ScrollController _scrollController = new ScrollController();
  AnimationController rotateController;

  @override
  void initState() {
    super.initState();
    rotateController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 200),
    );

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(2.0, 0.0))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: EdgeInsets.only(right: 16, bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Container(
                child: _showFloatingOptions(),
                width: 60,
              ),
            ),
            AnimatedBuilder(
              animation: rotateController,
              builder: (BuildContext context, Widget _widget) {
                return Transform.rotate(
                  angle: rotateController.value * 6.3,
                  child: FloatingActionButton(
                    backgroundColor: widget.btnBackgroundColor != null
                        ? widget.btnBackgroundColor
                        : Theme.of(context).accentColor,
                    onPressed: () {
                      _changeFloatingVisibility();
                    },
                    child: isFloatClicked
                        ? Icon(widget.postMenuIcon != null
                            ? widget.postMenuIcon
                            : Icons.done)
                        : Icon(widget.preMenuIcon != null
                            ? widget.preMenuIcon
                            : Icons.menu),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _changeFloatingVisibility() {
    _scrollController.animateTo(0.0,
        curve: Curves.easeOut, duration: const Duration(milliseconds: 1));

    isFloatClicked = !isFloatClicked;
    setState(() {});
  }

  Widget _showFloatingOptions() {
    if (isFloatClicked) {
      rotateController.forward();
      controller.reverse();
    } else {
      rotateController.reverse();
      controller.forward();
    }

    return SlideTransition(
      position: offset,
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: widget.menuList.length,
        itemBuilder: (BuildContext context, int index) {
          var menuItem = widget.menuList[index];
          double bottomPadding = 0;
          if (index == 0) {
            bottomPadding = 8;
          }
          return Container(
            padding: EdgeInsets.only(left: 8, right: 8, bottom: bottomPadding),
            child: FloatingActionButton(
              onPressed: () {
                _changeFloatingVisibility();
                widget.callback.onMenuClick(menuItem);
              },
              backgroundColor: menuItem.backgroundColor != null
                  ? menuItem.backgroundColor
                  : Theme.of(context).accentColor,
              child: Icon(menuItem.icon),
            ),
          );
        },
      ),
    );
  }
}

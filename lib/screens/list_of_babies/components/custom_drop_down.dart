import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final Function enableDisableScroll;

  CustomDropDown(this.enableDisableScroll);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final color = const Color(0xff82A0C8);
  final FocusNode _focusNode = FocusNode();

  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();
  bool isDropDownOpened = false;

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: this._layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, size.height - 4),
                child: Material(
                  elevation: 50.0,
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      this._focusNode.unfocus();
                      this._overlayEntry.remove();
                      widget.enableDisableScroll();
                      setState(() {
                        isDropDownOpened = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Time",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Status",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Location",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: this._layerLink,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color, // background
          onPrimary: Colors.white, // foreground
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        focusNode: this._focusNode,
        onPressed: () {
          setState(() {
            isDropDownOpened = !isDropDownOpened;
            if (isDropDownOpened) {
              widget.enableDisableScroll();
              this._overlayEntry = this._createOverlayEntry();
              Overlay.of(context)!.insert(this._overlayEntry);
            } else {
              widget.enableDisableScroll();
              this._focusNode.unfocus();
              this._overlayEntry.remove();
            }
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text(
                'Sort By',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            isDropDownOpened
                ? Icon(
                    Icons.arrow_drop_up,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  )
          ],
        ),
      ),
    );
  }
}

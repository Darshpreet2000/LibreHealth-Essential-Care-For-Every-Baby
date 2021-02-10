import 'package:flutter/material.dart';
class CustomDropDown extends StatefulWidget {
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {

  final color = const Color(0xff82A0C8);
  final FocusNode _focusNode = FocusNode();

  OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();
  bool isDropDownOpened=false;


  OverlayEntry _createOverlayEntry() {

    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;

    return OverlayEntry(
        builder: (context) => Positioned(
          width: size.width+5,
          child: CompositedTransformFollower(
            link: this._layerLink,
            showWhenUnlinked: false,
            offset: Offset(-5.0, size.height-2),
            child: Material(
              elevation: 60.0,
              color: Colors.transparent,
              child:GestureDetector(
                onTap: (){
                  this._focusNode.unfocus();
                  this._overlayEntry.remove();
                  setState(() {

                    isDropDownOpened=false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(

                    color: color,borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Time",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: Container(width: double.infinity,height: 1,color: Colors.white,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Status",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: Container(width: double.infinity,height: 1,color: Colors.white,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Location",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: this._layerLink,
      child: TextField(
        focusNode: this._focusNode,
        readOnly: true,
        onTap: (){
          setState(() {

            isDropDownOpened=!isDropDownOpened;
            if(isDropDownOpened){
              this._overlayEntry = this._createOverlayEntry();
              Overlay.of(context).insert(this._overlayEntry);
            }
            else{
              this._focusNode.unfocus();
              this._overlayEntry.remove();
            }
          });
        },
        decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: 'Sort By',
          hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),

          suffixIcon: isDropDownOpened?Icon(Icons.arrow_drop_up,color: Colors.white,):Icon(Icons.arrow_drop_down,color: Colors.white,),
        ),
      ),
    );
  }
}
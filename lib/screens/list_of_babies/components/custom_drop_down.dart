import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/bloc/list_of_babies_bloc/list_of_babies_bloc.dart';
import 'package:newborn_care/models/sort_list_enum.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';

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
  String getWidgetTextString() {
    SortListEnum sortListEnum =
        RepositoryProvider.of<HiveStorageRepository>(context).getSortBy();
    String text = AppLocalizations.of(context)!.sortBy;
    if (sortListEnum == SortListEnum.time)
      text = AppLocalizations.of(context)!.time;
    if (sortListEnum == SortListEnum.status)
      text = AppLocalizations.of(context)!.status;
    if (sortListEnum == SortListEnum.location)
      text = AppLocalizations.of(context)!.location;
    return text;
  }

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
                          InkWell(
                            onTap: () {
                              BlocProvider.of<ListOfBabiesBloc>(context)
                                  .add(ListOfBabiesSortList(SortListEnum.time));
                              this._focusNode.unfocus();
                              this._overlayEntry.remove();
                              widget.enableDisableScroll();
                              setState(() {
                                isDropDownOpened = false;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                AppLocalizations.of(context)!.time,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
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
                          InkWell(
                            onTap: () {
                              BlocProvider.of<ListOfBabiesBloc>(context).add(
                                  ListOfBabiesSortList(SortListEnum.status));
                              this._focusNode.unfocus();
                              this._overlayEntry.remove();
                              widget.enableDisableScroll();
                              setState(() {
                                isDropDownOpened = false;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                AppLocalizations.of(context)!.status,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
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
                          InkWell(
                            onTap: () {
                              BlocProvider.of<ListOfBabiesBloc>(context).add(
                                  ListOfBabiesSortList(SortListEnum.location));
                              this._focusNode.unfocus();
                              this._overlayEntry.remove();
                              widget.enableDisableScroll();
                              setState(() {
                                isDropDownOpened = false;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                AppLocalizations.of(context)!.location,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
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
      child: Container(
        height: 45,
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
              Flexible(
                child: Text(
                  getWidgetTextString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}

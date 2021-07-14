import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/bloc/list_of_babies_bloc/list_of_babies_bloc.dart';
import 'package:newborn_care/screens/list_of_babies/components/custom_drop_down.dart';

import 'babies_list_view.dart';

class Body extends StatelessWidget {
  final color = const Color(0xff82A0C8);
  final enableDisableScroll;

  Body(this.enableDisableScroll);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchAndSort(context),
          BabiesListViewRecentlyAdded(),
          BabiesListViewPastAdded()
        ],
      ),
    );
  }

  Widget searchAndSort(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: searchContainer(context)),
          SizedBox(
            width: 4,
          ),
          Expanded(flex: 1, child: CustomDropDown(this.enableDisableScroll))
        ],
      ),
    );
  }

  Widget searchContainer(BuildContext context) {
    return Container(
      height: 45,
      child: TextField(
        onChanged: (text) {
          BlocProvider.of<ListOfBabiesBloc>(context)
              .add(ListOfBabiesSearchList(text));
        },
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide.none,
          ),
          fillColor: color,
          filled: true,
          hintText: "Search the list of babies",
          hintStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 18,
          ),
        ),
        textAlign: TextAlign.start,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}

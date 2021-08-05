import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/bloc/list_of_babies_bloc/list_of_babies_bloc.dart';
import 'list_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BabiesListViewRecentlyAdded extends StatelessWidget {
  const BabiesListViewRecentlyAdded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ListOfBabiesBloc, ListOfBabiesState>(
      listener: (context, state) {
        if (state is ListOfBabiesErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: BlocBuilder<ListOfBabiesBloc, ListOfBabiesState>(
        builder: (context, state) {
          if (state is ListOfBabiesLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (state is ListOfBabiesLoaded &&
              state.childListRecently.isNotEmpty) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 8, 0),
                    child: Text(
                      AppLocalizations.of(context)!.recentlyAdded,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.childListRecently.length,
                    itemBuilder: (context, index) {
                      return ListItem(state.childListRecently[index], true);
                    },
                  ),
                ],
              ),
            );
          } else if (state is ListOfBabiesLoaded &&
              state.childListRecently.isEmpty &&
              state.childListPastRegistered.isEmpty)
            return Container(
              height: MediaQuery.of(context).size.height / 1.8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.noRegisteredBaby,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          return Container();
        },
      ),
    );
  }
}

class BabiesListViewPastAdded extends StatelessWidget {
  const BabiesListViewPastAdded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListOfBabiesBloc, ListOfBabiesState>(
      builder: (context, state) {
        if (state is ListOfBabiesLoaded &&
            state.childListPastRegistered.isNotEmpty) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
                  child: Text(
                    AppLocalizations.of(context)!.pastRegistered,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.childListPastRegistered.length,
                  itemBuilder: (context, index) {
                    return ListItem(state.childListPastRegistered[index], true);
                  },
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

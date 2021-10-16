import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:formula1/bloc/results/results_bloc.dart';
import 'package:formula1/components/custom_dropdown.dart';
import 'package:formula1/components/home_header.dart';
import 'package:formula1/components/ranking_card.dart';
import 'package:formula1/models/driver_ranking.dart';
import 'package:formula1/services/api_manager.dart';

import '../../constants.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late Future<List<Result>> results;

  int _dropdownValue = 2021;
  final List<DropdownMenuItem<int>> _dropdownItems = [];

  @override
  void initState() {
    super.initState();

    _dropdownItems.clear();

    for (int i = 2000; i <= 2021; i++) {
      var d = DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      );
      _dropdownItems.add(d);
    }

    context.read<ResultsBloc>().add(GetResults(_dropdownValue));
  }

  void setDropdownValue(int value) {
    setState(() {
      _dropdownValue = value;
    });

    context.read<ResultsBloc>().add(GetResults(_dropdownValue));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        const Header(title: "Results"),
        CustomDropDown(
            value: _dropdownValue,
            hint: "Choose season...",
            items: _dropdownItems,
            onChanged: setDropdownValue),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            child: BlocConsumer<ResultsBloc, ResultsState>(
              builder: (context, state) {
                if (state is ResultsLoaded) {
                  return ListView.builder(
                      itemCount: state.model.length,
                      itemBuilder: (context, index) {
                        var ranking = state.model[index];

                        return Container(
                          height: 85,
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              RankingCard(
                                result: ranking,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Divider(
                                indent: 30,
                                endIndent: 75,
                                color: Colors.white.withAlpha(64),
                                thickness: 0.4,
                              )
                            ],
                          ),
                        );
                      });
                } else {
                  return const SpinKitFadingCircle(
                    color: Colors.white,
                    size: 70,
                  );
                }
              },
              listener: (context, state) {},
            ),
          ),
        )
      ],
    ));
  }
}

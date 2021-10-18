import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:formula1/bloc/circuits/circuits_bloc.dart';
import 'package:formula1/components/circuit_card.dart';
import 'package:formula1/components/home_header.dart';
import 'package:formula1/models/circuit_model.dart';

class CircuitsPage extends StatefulWidget {
  const CircuitsPage({Key? key}) : super(key: key);

  @override
  State<CircuitsPage> createState() => _CircuitsPageState();
}

class _CircuitsPageState extends State<CircuitsPage> {
  late Future<List<CircuitModel>> news;

  @override
  void initState() {
    super.initState();

    context.read<CircuitsBloc>().add(GetCircuitsList());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(children: [
          const Header(title: "Formula 1\nNews"),
          Expanded(
              child: Container(
            color: Colors.white,
            child: BlocConsumer<CircuitsBloc, CircuitsState>(
              builder: (context, state) {
                if (state is CircuitsLoaded) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.model.length,
                      itemBuilder: (context, index) {
                        var circuitsModel = state.model[index];

                        return CircuitCard(
                            circuit: circuitsModel, index: index);
                      });
                } else {
                  return const SpinKitWave(
                    color: Colors.blueGrey,
                    size: 35,
                  );
                }
              },
              listener: (context, state) {},
            ),
          ))
        ]));
  }
}

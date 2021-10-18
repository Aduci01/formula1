import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formula1/models/circuit_model.dart';

class CircuitCard extends StatelessWidget {
  final CircuitModel circuit;
  final int index;

  final List<Color> colors = [const Color(0xFF002B3D)];

  CircuitCard({Key? key, required this.circuit, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(circuit.circuitName),
      subtitle: Text(circuit.locality),
      controlAffinity: ListTileControlAffinity.leading,
      children: <Widget>[
        ListTile(title: Text('This is tile number 3')),
        Image(
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return const Icon(Icons.error);
          },
          image: Image.asset(
                  "assets/images/circuits/" + circuit.circuitId + ".png")
              .image,
        )
      ],
    );
  }
}

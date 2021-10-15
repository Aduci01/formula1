import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formula1/constants.dart';

class CustomDropDown extends StatelessWidget {
  final int value;
  final String hint;
  final List<DropdownMenuItem<int>> items;
  final Function onChanged;

  const CustomDropDown({
    Key? key,
    required this.value,
    required this.hint,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 5),
            child: DropdownButton<int>(
              value: value,
              hint: Text(
                hint,
                style: TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
              style: kTitleTextstyle,
              items: items,
              onChanged: (item) {
                onChanged(item);
              },
              isExpanded: true,
              underline: Container(),
              icon: Icon(Icons.keyboard_arrow_down),
            ),
          ),
        ),
      ],
    );
  }
}

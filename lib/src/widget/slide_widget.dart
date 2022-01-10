import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final ValueChanged<double>? onChanged;
  final String title;
  final double value;
  final IconData? icon;

  const SliderWidget(
      {Key? key, this.title = "", this.value = 50.0, this.icon, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _value = value;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Icon(icon,
          size: 28,
          color: Colors.black45,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 22),
              child: Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black26)),
            ),
            Slider(
              //slider volumen multimedia
              value: _value,
              max: 100,
              divisions: 100,
              label: _value.round().toString(),
              onChanged: (double value) {
                _value = value;
                onChanged!(value);
              },
            ),
          ],
        )),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PreferenceButtons extends StatefulWidget {
  @override
  _PreferenceButtonsState createState() => _PreferenceButtonsState();
}

List<IconData> _icons = [
  FontAwesomeIcons.plane,
  FontAwesomeIcons.bed,
  FontAwesomeIcons.walking,
  FontAwesomeIcons.biking,
];

class _PreferenceButtonsState extends State<PreferenceButtons> {
  int _selectedButton = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _icons
          .asMap()
          .map(
            (k, v) => MapEntry(
              k,
              Material(
                clipBehavior: Clip.hardEdge,
                color: k == _selectedButton
                    ? Theme.of(context).accentColor
                    : Colors.grey[200],
                shape: CircleBorder(),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedButton = k;
                    });
                  },
                  child: Ink(
                    height: 60,
                    width: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: FaIcon(
                        _icons[k],
                        color: k == _selectedButton
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}

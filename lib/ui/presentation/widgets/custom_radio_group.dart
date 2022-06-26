import 'package:flutter/material.dart';

/// Orientation Options
enum RGOrientation { VERTICAL, HORIZONTAL }

class CustomRadioGroup extends StatefulWidget {
  final RGOrientation? orientation;

  final List<String> titles;
  final String? label;
  final TextStyle labelStyle;
  final int? defaultSelected;
  final Function(int?)? onChanged;
  final bool labelVisible;
  final Color? activeColor;
  final TextStyle titleStyle;

  /// Define parameter widget
  const CustomRadioGroup(
      {Key? key,
        this.orientation = RGOrientation.HORIZONTAL,
        required this.titles,
        this.label,
        this.labelStyle = const TextStyle(fontSize: 12),
        this.onChanged,
        this.defaultSelected,
        this.labelVisible = true,
        this.activeColor,
        this.titleStyle = const TextStyle(fontSize: 14)})
      : super(key: key);

  @override
  CustomRadioGroupState createState() => CustomRadioGroupState();
}

/// Set state as Public to access update index radio group
class CustomRadioGroupState extends State<CustomRadioGroup> {
  int? _defaultValue = 0;

  /// Set default selected 0
  @override
  void initState() {
    super.initState();
    _defaultValue = widget.defaultSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.labelVisible,
          child: Text(
            widget.label ?? "",
            style: widget.labelStyle,
          ),
        ),

        /// Display widget from Selected Orientation, default is Vertical
        widget.orientation == RGOrientation.VERTICAL
            ? _vertical()
            : _horizontal()
      ],
    );
  }

  /// Horizontal View
  Widget _horizontal() {
    /// Use Scrollview to fix overlap widget
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(

          children: Iterable<int>.generate(widget.titles.length).map((index) {
            return Row(
              children: [
                SizedBox(
                  width: 24,
                  child: Radio(
                    value: index,
                    groupValue: _defaultValue,
                    activeColor:
                    widget.activeColor ?? Theme.of(context).primaryColor,
                    onChanged: (int? value) {
                      setState(() {
                        _defaultValue = value;
                        widget.onChanged!(_defaultValue);
                      });
                    },
                  ),
                ),
                const SizedBox(width: 4),
                InkWell(
                  onTap: () {
                    setState(() {
                      _defaultValue = index;
                      widget.onChanged!(_defaultValue);
                    });
                  },
                  child: Text(
                    widget.titles[index],
                    style: widget.titleStyle,
                  ),
                ),
                const SizedBox(width: 30),
              ],
            );
          }).toList()),
    );
  }

  /// Vertical View
  Widget _vertical() {
    return Column(
      children: Iterable<int>.generate(widget.titles.length)
          .map(
            (index) => RadioListTile(
          title: Text(
            widget.titles[index],
            style: widget.titleStyle,
          ),
          value: index,
          groupValue: _defaultValue,
          activeColor: widget.activeColor ?? Theme.of(context).primaryColor,
          onChanged: (int? value) {
            setState(() {
              _defaultValue = value;
              widget.onChanged!(_defaultValue);
            });
          },
        ),
      )
          .toList(),
    );
  }

  /// Update index programmatically
  setIndexSelected(int index) {
    setState(() {
      if (index < widget.titles.length) _defaultValue = index;
    });
  }
}

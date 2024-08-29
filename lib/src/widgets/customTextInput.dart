import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mks_app/src/constant/textstyle.dart';

class CustomTextInput extends StatefulWidget {
  final String hintText;
  final String title;
  final TextEditingController controller;
  final bool isDate;
  final bool isBody;

  final TextInputType textInputType;
  @override
  CustomTextInput(
      {super.key,
      required this.hintText,
      required this.title,
      required this.controller,
      required this.isDate,
      required this.isBody,
      required this.textInputType});

  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  _selectDate() async {
    DateTime? _date = await showDatePicker(
        context: context,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));

    setState(() {
      widget.controller.text = DateFormat('dd-MM-yyyy').format(_date!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.title} :",
          style: secondaryStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          minLines: 1,
          maxLines: widget.isBody == false ? 1 : 8,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          style: secondaryStyle,
          // textInputAction: widget.isBody == false
          //     ? TextInputAction.done
          //     : TextInputAction.newline,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              hintText: widget.hintText,
              hintStyle: secondaryStyle,
              suffixIcon: widget.isDate == false
                  ? null
                  : IconButton(
                      onPressed: () => _selectDate(),
                      icon: const Icon(Icons.calendar_month_rounded)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 1))),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

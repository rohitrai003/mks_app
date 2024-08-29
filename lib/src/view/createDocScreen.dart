import 'package:flutter/material.dart';
import 'package:mks_app/src/constant/color.dart';
import 'package:mks_app/src/constant/textstyle.dart';
import 'package:mks_app/src/controller/createPdf.dart';
import 'package:mks_app/src/widgets/customTextInput.dart';

// ignore: must_be_immutable
class CreateDocScreen extends StatefulWidget {
  final String? t;
  final bool customTitle;
  final String appbartitle;
  CreateDocScreen(
      {super.key,
      required this.t,
      required this.appbartitle,
      required this.customTitle});

  @override
  State<CreateDocScreen> createState() => _CreateDocScreenState();
}

class _CreateDocScreenState extends State<CreateDocScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController copyTo = TextEditingController();
  TextEditingController issuedPersonName = TextEditingController();
  TextEditingController issuedPersonDesignation = TextEditingController();

  bool addCopyTo = false;
  List<Widget> items = [
    CustomTextInput(
        hintText: "Eg: President MKS for kind version",
        title: "",
        controller: TextEditingController(),
        isDate: false,
        isBody: true,
        textInputType: TextInputType.text),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: Text(
          widget.appbartitle,
          style: primaryStyle,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.customTitle == true
                  ? CustomTextInput(
                      hintText:
                          "Write Your Heading eg Application, Condolence,etc",
                      title: "Application Type",
                      controller: title,
                      textInputType: TextInputType.text,
                      isDate: false,
                      isBody: false,
                    )
                  : Container(),
              CustomTextInput(
                hintText: "Format: dd-mm-yyyy eg: 23-05-2024",
                title: "Date",
                controller: date,
                textInputType: TextInputType.text,
                isDate: true,
                isBody: false,
              ),
              CustomTextInput(
                hintText: "Description...",
                title: "Body",
                controller: body,
                textInputType: TextInputType.multiline,
                isDate: false,
                isBody: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Copy to : ",
                    style: secondaryStyle,
                  ),
                  Checkbox(
                    value: addCopyTo,
                    onChanged: (value) {
                      setState(() {
                        addCopyTo = !addCopyTo;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Issued By :",
                        style: secondaryStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: lightGreen,
                            border: Border.all(width: 1, color: lightGrey)),
                        child: TextFormField(
                          controller: issuedPersonName,
                          decoration: InputDecoration(
                              hintText: "Name of the Person ",
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintStyle: secondaryStyle),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Designation :",
                        style: secondaryStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: lightGreen,
                            border: Border.all(width: 1, color: lightGrey)),
                        child: TextFormField(
                          controller: issuedPersonDesignation,
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Eg : General Secretary, President",
                              hintStyle: secondaryStyle),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        widget.customTitle == true
                            ? createPDF(
                                title.text,
                                date.text,
                                body.text,
                                issuedPersonName.text,
                                issuedPersonDesignation.text,
                                addCopyTo)
                            : createPDF(
                                widget.appbartitle,
                                date.text,
                                body.text,
                                issuedPersonName.text,
                                issuedPersonDesignation.text,
                                addCopyTo);
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 50),
                          backgroundColor: white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: green, width: 2))),
                      child: const Text(
                        "CREATE",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            letterSpacing: 3),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

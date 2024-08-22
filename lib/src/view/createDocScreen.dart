import 'package:flutter/material.dart';
import 'package:mks_app/src/constant/color.dart';
import 'package:mks_app/src/constant/textstyle.dart';
import 'package:mks_app/src/controller/createPdf.dart';
import 'package:mks_app/src/widgets/customTextInput.dart';

// ignore: must_be_immutable
class CreateDocScreen extends StatelessWidget {
  final String? t;
  final String appbartitle;
  CreateDocScreen({super.key, required this.t, required this.appbartitle});

  late TextEditingController title;
  TextEditingController date = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController issuedPersonName = TextEditingController();
  TextEditingController issuedPersonDesignation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    title = TextEditingController(text: t);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: Text(
          appbartitle,
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
              title.text.isEmpty
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
                        createPDF(
                            title.text,
                            date.text,
                            body.text,
                            issuedPersonName.text,
                            issuedPersonDesignation.text);
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

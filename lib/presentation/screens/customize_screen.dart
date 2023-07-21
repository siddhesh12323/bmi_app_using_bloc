// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({super.key});

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  int currentPageIndex = 0;
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);
  String? _dropdownvalueWeight;
  String? _dropdownvalueHeight;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customize"),
        centerTitle: true,
        backgroundColor: isDarkMode ? const Color.fromARGB(171, 79, 76, 76) : Colors.white,
            foregroundColor: !isDarkMode ? const Color.fromARGB(171, 79, 76, 76) : Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 80,
              child: Row(
                children: <Widget>[
                  const Text("Change Theme"),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      void changeColor(Color color) {
                        setState(() => pickerColor = color);
                      }

                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Pick a color!'),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: pickerColor,
                                  onColorChanged: changeColor,
                                ),
                                // Use Material color picker:
                                //
                                // child: MaterialPicker(
                                //   pickerColor: pickerColor,
                                //   onColorChanged: changeColor,
                                //   showLabel: true, // only on portrait mode
                                // ),
                                //
                                // Use Block color picker:
                                //
                                // child: BlockPicker(
                                //   pickerColor: currentColor,
                                //   onColorChanged: changeColor,
                                // ),
                                //
                                // child: MultipleChoiceBlockPicker(
                                //   pickerColors: currentColors,
                                //   onColorsChanged: changeColors,
                                // ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Got it'),
                                  onPressed: () {
                                    setState(() => currentColor = pickerColor);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: currentColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 80,
              child: Row(
                children: <Widget>[
                  const Text("Change Font"),
                  const Spacer(),
                  Container(
                    height: 30,
                    width: 60,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Container(
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 26,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          title: Text(index.toString()),
                                        );
                                      }),
                                ),
                              );
                            });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              child: Row(
                children: <Widget>[
                  const Text("Change Weight Units"),
                  const Spacer(),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        value: "kg",
                        child: Text("kg"),
                      ),
                      DropdownMenuItem(
                        value: "lb",
                        child: Text("lb"),
                      ),
                    ],
                    onChanged: (selectedValue) {
                      if (selectedValue is String) {
                        setState(() {
                          _dropdownvalueWeight = selectedValue;
                        });
                      }
                    },
                    value: _dropdownvalueWeight,
                  )
                ],
              ),
            ),
            Container(
              height: 80,
              child: Row(
                children: <Widget>[
                  const Text("Change Height Units"),
                  const Spacer(),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        value: "m",
                        child: Text("m"),
                      ),
                      DropdownMenuItem(
                        value: "ft",
                        child: Text("ft"),
                      ),
                    ],
                    onChanged: (selectedValue) {
                      if (selectedValue is String) {
                        setState(() {
                          _dropdownvalueHeight = selectedValue;
                        });
                      }
                    },
                    value: _dropdownvalueHeight,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

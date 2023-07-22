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
  List<String> fontList = [
    'Atrament',
    'Cedarville',
    'Comic Neue',
    'Dork Diary',
    'Fondamento',
    'Merriweather',
    'Montserrat',
    'NotoSans',
    'Patrick Hand',
    'PinyonScript',
    'Proxima Nova',
    'Raleway',
    'Source Sans Pro',
    'Space Mono'
  ];

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        double dx = details.delta.dx;
        if (dx > 0) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Customize"),
          centerTitle: true,
          backgroundColor:
              isDarkMode ? const Color.fromARGB(171, 79, 76, 76) : Colors.white,
          foregroundColor: !isDarkMode
              ? const Color.fromARGB(171, 79, 76, 76)
              : Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //* Color Picker
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
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: const Text('Got it'),
                                    onPressed: () {
                                      setState(
                                          () => currentColor = pickerColor);
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
              //* Font Picker
              Container(
                height: 80,
                child: Row(
                  children: <Widget>[
                    const Text("Change Font"),
                    const Spacer(),
                    Container(
                      height: 30,
                      width: 100,
                      child: TextButton(
                        onPressed: () {
                          final controller = AnimationController(
                            duration: const Duration(
                                milliseconds:
                                    400), // Adjust the duration as needed
                            vsync: Navigator.of(context),
                          );

                          // Define the animation curve (e.g., easeIn, easeOut, easeInOut)
                          final animation = CurvedAnimation(
                              parent: controller, curve: Curves.fastOutSlowIn);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AnimatedBuilder(
                                  animation: animation,
                                  builder: (context, child) {
                                    return Transform.scale(
                                      scale: animation.value,
                                      child: AlertDialog(
                                        content: Container(
                                          width: double.maxFinite,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: fontList.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  onTap: () {
                                                    controller.reverse().then(
                                                        (value) => Navigator.of(
                                                                context)
                                                            .pop());
                                                  },
                                                  title: Text(
                                                    fontList[index],
                                                    style: TextStyle(
                                                        fontFamily:
                                                            fontList[index]),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                          controller.forward();
                        },
                        child: Center(
                            child: FittedBox(child: Text('currentFont'))),
                      ),
                    ),
                  ],
                ),
              ),
              //* Weight units change
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
              //* Height units change
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
      ),
    );
  }
}

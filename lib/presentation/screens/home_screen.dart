import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
            double dx = details.delta.dx;
            if (dx < 0) {
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //   content: Text("Swiped left"),
              //   duration: Duration(milliseconds: 150),
              // ));
              Navigator.of(context).pushNamed('/customize');
            }
          },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("BMI Calculator"),
            centerTitle: true,
            backgroundColor: isDarkMode ? const Color.fromARGB(171, 79, 76, 76) : Colors.white,
            foregroundColor: !isDarkMode ? const Color.fromARGB(171, 79, 76, 76) : Colors.white,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _weightController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Weight',
                      //! UPDATE UI NEEDED
                      hintText: 'Weight in kg',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _heightController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Height',
                      //! UPDATE UI NEEDED
                      hintText: 'Height in m',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FilledButton(
                      onPressed: () {}, child: const Text("Calculate")),
                  const SizedBox(
                    height: 30,
                  ),
                  FilledButton(onPressed: () {}, child: const Text("Reset")),
                ],
              ),
            ),
          )),
    );
  }
}

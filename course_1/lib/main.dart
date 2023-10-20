import 'package:course_1/entity/registration_entity.dart';
import 'package:course_1/text_box.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<bool> toggleButtonSelection = [false, false];
  final List<Widget> toggleButtonPossibilities = const [
    Text("Zusage"),
    Text("Absage")
  ];

  final TextEditingController controllerFirstName = TextEditingController();
  final TextEditingController controllerLastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.send),
          onPressed: () {
            var newEntity = RegistrationEntity(
                firstName: controllerFirstName.text,
                lastName: controllerLastName.text,
                hasAccepted: toggleButtonSelection[0]);
          },
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextBox(labelText: "Vorname", controller: controllerFirstName),
            const SizedBox(height: 10),
            TextBox(labelText: "Nachname", controller: controllerLastName),
            const SizedBox(height: 15),
            ToggleButtons(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              constraints: const BoxConstraints(minWidth: 100, minHeight: 35),
              selectedBorderColor: Colors.blue,
              selectedColor: Colors.blue,
              isSelected: toggleButtonSelection,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < toggleButtonSelection.length; i++) {
                    toggleButtonSelection[i] = i == index;
                  }
                });
              },
              children: toggleButtonPossibilities,
            )
          ],
        )),
      ),
    );
  }
}

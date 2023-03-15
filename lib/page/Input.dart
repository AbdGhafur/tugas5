import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.myController,
  }) : super(key: key);

  final TextEditingController myController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: const InputDecoration(
        hintText: "Masukkan Suhu Dalam Celcius",
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
    );
  }
}

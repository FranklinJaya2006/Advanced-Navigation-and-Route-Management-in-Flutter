import 'package:assignmentnavigation/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Number of Screens')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter number of screens',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final int? number = int.tryParse(controller.text);
                if (number == null || number <= 0) {
                  // Menangani input tidak valid
                  Get.snackbar(
                    'Invalid Input',
                    'Please enter a valid positive number',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.orange,
                    colorText: Colors.white,
                  );
                } else {
                  // Mengupdate nilai screenCount menggunakan Provider
                  Provider.of<ScreenState>(context, listen: false).setScreenCount(number);

                  // Navigasi ke halaman dinamis setelah input valid
                  Get.toNamed('/dynamic');
                }
              },
              child: Text('Generate Screens'),
            ),
          ],
        ),
      ),
    );
  }
}

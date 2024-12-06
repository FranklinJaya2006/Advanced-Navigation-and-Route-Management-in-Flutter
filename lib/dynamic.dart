import 'package:assignmentnavigation/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart';

class DynamicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil data screenCount dari provider
    final int number = Provider.of<ScreenState>(context).screenCount;

    // Menangani kasus ketika jumlah layar invalid
    if (number <= 0) {
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(
          child: Text(
            'Terjadi kesalahan: Jumlah layar tidak valid!',
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Screens'), automaticallyImplyLeading: false),
      body: ListView.builder(
        itemCount: number,
        itemBuilder: (context, index) {
          return OpenContainer(
            closedElevation: 0,
            closedBuilder: (context, openContainer) {
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text('Screen ${index + 1}'),
                  onTap: openContainer,
                ),
              );
            },
            openBuilder: (context, closeContainer) {
              return ScreenContent(index: index);
            },
          );
        },
      ),
    );
  }
}

class ScreenContent extends StatelessWidget {
  final int index;

  ScreenContent({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen ${index + 1} Content')),
      body: Center(
        child: Text(
          'This is Screen ${index + 1}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

import 'package:festival_post_app/components/list.dart';
import 'package:festival_post_app/components/methods.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Festivals',
          style: TextStyle(
            color: Color(0xffb4e6ff),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: festivalName.length,
          itemBuilder: (
            context,
            index,
          ) {
            return festival(
              index: index,
              context: context,
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

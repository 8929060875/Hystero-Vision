import 'package:flutter/material.dart';
import 'package:hystero/screens/labeller.dart';
import 'package:hystero/services/api.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  static const routeName = '/loading-screen';

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: DataImage.fetchImage(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            print(snapshot.data);
            return const Text('Data didnt load');
          } else if (snapshot.hasData) {
            // print(snapshot.data);
            return Labeller(
              snapshot: snapshot,
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: const Color.fromRGBO(255, 141, 199, 1),
                automaticallyImplyLeading: false,
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

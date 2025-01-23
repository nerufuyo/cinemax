import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/contollers.dart';

class DetailScreen extends GetView<DetailController> {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Detail Screen'),
      ),
    );
  }
}

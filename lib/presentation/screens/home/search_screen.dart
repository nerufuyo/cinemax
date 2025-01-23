import 'package:cinemax/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

import '../../../common/styles/style.dart';

class SearchScreen extends HomeScreen {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search Screen', style: AppTypography.h1),
    );
  }
}

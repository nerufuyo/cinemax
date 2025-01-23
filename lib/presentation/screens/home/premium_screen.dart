import 'package:cinemax/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

import '../../../common/styles/style.dart';

class PremiumScreen extends HomeScreen {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Premium Screen', style: AppTypography.h1),
    );
  }
}

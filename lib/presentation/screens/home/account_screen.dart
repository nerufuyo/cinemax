import 'package:cinemax/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

import '../../../common/styles/style.dart';

class AccountScreen extends HomeScreen {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Account Screen', style: AppTypography.h1),
    );
  }
}

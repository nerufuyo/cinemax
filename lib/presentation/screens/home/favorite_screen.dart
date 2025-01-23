import 'package:cinemax/common/styles/style.dart';
import 'package:cinemax/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends HomeScreen {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favorite Screen', style: AppTypography.h1),
    );
  }
}

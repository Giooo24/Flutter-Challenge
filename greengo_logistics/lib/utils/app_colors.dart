import 'package:flutter/material.dart';

class AppColors {
  // Colores principales
  static const primary = Color(0xFF059669);
  static const secondary = Color(0xFF0D9488);
  
  // Gradientes
  static const headerGradient = LinearGradient(
    colors: [Color(0xFF059669), Color(0xFF0D9488)],
  );
  
  static const backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFECFDF5), Color(0xFFE0F2FE), Color(0xFFCFFAFE)],
  );
  
  static const completedGradient = LinearGradient(
    colors: [Color(0xFF10B981), Color(0xFF0D9488)],
  );
  
  static const pendingGradient = LinearGradient(
    colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)],
  );
}

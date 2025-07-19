import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../widgets/ayurveda_section_card.dart';

class AyurvedaPage extends StatelessWidget {
  const AyurvedaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        title: const Text('Ayurveda Healing Zone'),
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.ayurveda.withOpacity(0.2), AppColors.ayurveda.withOpacity(0.1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.ayurveda.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.local_florist,
                    size: 48,
                    color: AppColors.ayurveda,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Ayurveda Healing Zone',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ancient wisdom for modern wellness. Discover the power of Ayurvedic healing through daily routines, seasonal care, and natural remedies.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Ayurveda Sections
            AyurvedaSectionCard(
              title: AppStrings.dinacharya,
              description: 'Daily routine practices for optimal health and balance',
              icon: Icons.wb_sunny,
              color: AppColors.ayurveda,
              onTap: () => _navigateToSection(context, 'dinacharya'),
            ),
            
            const SizedBox(height: 16),
            
            AyurvedaSectionCard(
              title: AppStrings.ritucharya,
              description: 'Seasonal lifestyle adjustments for year-round wellness',
              icon: Icons.nature,
              color: AppColors.ayurveda,
              onTap: () => _navigateToSection(context, 'ritucharya'),
            ),
            
            const SizedBox(height: 16),
            
            AyurvedaSectionCard(
              title: AppStrings.panchakarma,
              description: 'Five-fold detoxification and rejuvenation therapies',
              icon: Icons.spa,
              color: AppColors.ayurveda,
              onTap: () => _navigateToSection(context, 'panchakarma'),
            ),
            
            const SizedBox(height: 16),
            
            AyurvedaSectionCard(
              title: AppStrings.herbalRemedies,
              description: 'Natural plant-based medicines for various conditions',
              icon: Icons.eco,
              color: AppColors.ayurveda,
              onTap: () => _navigateToSection(context, 'herbal'),
            ),
            
            const SizedBox(height: 24),
            
            // Quick Tips Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.cardDark,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.borderLight,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daily Ayurvedic Tips',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTipItem('🌅', 'Wake up before sunrise (Brahma Muhurta)'),
                  _buildTipItem('🥛', 'Drink warm water with lemon in the morning'),
                  _buildTipItem('🧘', 'Practice meditation and pranayama daily'),
                  _buildTipItem('🍽️', 'Eat your largest meal at midday'),
                  _buildTipItem('🌙', 'Sleep by 10 PM for optimal rest'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipItem(String emoji, String tip) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              tip,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToSection(BuildContext context, String section) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening $section section...'),
        backgroundColor: AppColors.ayurveda,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}


import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../widgets/therapy_section_card.dart';

class NaturopathyPage extends StatelessWidget {
  const NaturopathyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        title: const Text('Naturopathy & Mudra Therapy'),
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
                  colors: [AppColors.naturopathy.withOpacity(0.2), AppColors.naturopathy.withOpacity(0.1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.naturopathy.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.back_hand,
                    size: 48,
                    color: AppColors.naturopathy,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Naturopathy & Mudra Therapy',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Harness the healing power of nature through hand mudras, water therapy, earth therapy, and sun therapy for holistic wellness.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Therapy Sections
            TherapySectionCard(
              title: AppStrings.handMudras,
              description: 'Specific hand positions for healing various diseases and conditions',
              icon: Icons.back_hand,
              color: AppColors.naturopathy,
              onTap: () => _navigateToSection(context, 'mudras'),
            ),
            
            const SizedBox(height: 16),
            
            TherapySectionCard(
              title: AppStrings.hydrotherapy,
              description: 'Water-based treatments for detoxification and healing',
              icon: Icons.water_drop,
              color: AppColors.naturopathy,
              onTap: () => _navigateToSection(context, 'hydrotherapy'),
            ),
            
            const SizedBox(height: 16),
            
            TherapySectionCard(
              title: AppStrings.earthTherapy,
              description: 'Clay and mud therapy for natural healing and detox',
              icon: Icons.landscape,
              color: AppColors.naturopathy,
              onTap: () => _navigateToSection(context, 'earth'),
            ),
            
            const SizedBox(height: 16),
            
            TherapySectionCard(
              title: AppStrings.sunTherapy,
              description: 'Sunlight therapy for vitamin D and energy healing',
              icon: Icons.wb_sunny,
              color: AppColors.naturopathy,
              onTap: () => _navigateToSection(context, 'sun'),
            ),
            
            const SizedBox(height: 24),
            
            // Popular Mudras Section
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
                    'Popular Healing Mudras',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildMudraItem('🙏', 'Gyan Mudra', 'For concentration and memory'),
                  _buildMudraItem('👌', 'Prithvi Mudra', 'For strength and stability'),
                  _buildMudraItem('🤏', 'Vayu Mudra', 'For gas and joint pain'),
                  _buildMudraItem('✋', 'Apana Mudra', 'For digestion and detox'),
                  _buildMudraItem('🤲', 'Surya Mudra', 'For weight loss and metabolism'),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Benefits Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.cardDark,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.naturopathy.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Naturopathy Benefits',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildBenefitItem('✅', 'No side effects'),
                  _buildBenefitItem('✅', 'Cost-effective treatment'),
                  _buildBenefitItem('✅', 'Boosts natural immunity'),
                  _buildBenefitItem('✅', 'Treats root cause'),
                  _buildBenefitItem('✅', 'Holistic healing approach'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMudraItem(String emoji, String name, String benefit) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  benefit,
                  style: const TextStyle(
                    color: AppColors.textTertiary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(String emoji, String benefit) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              benefit,
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
        backgroundColor: AppColors.naturopathy,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}


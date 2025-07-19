import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../widgets/ebook_card.dart';

class EbooksPage extends StatelessWidget {
  const EbooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        title: const Text('E-Book Section'),
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => _downloadAllBooks(context),
          ),
        ],
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
                  colors: [AppColors.ebooks.withOpacity(0.2), AppColors.ebooks.withOpacity(0.1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.ebooks.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.menu_book,
                    size: 48,
                    color: AppColors.ebooks,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Dr. Divyanshu\'s E-Book Collection',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Free access to comprehensive health guides authored by Dr. Divyanshu Patel. Download and read offline for your wellness journey.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Featured Books Section
            Text(
              'Featured Books',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // CT Scan Guide
            EbookCard(
              title: AppStrings.ctScanGuide,
              author: AppStrings.doctorName,
              description: 'Comprehensive guide to understanding CT scan reports, procedures, and interpretations for patients and healthcare professionals.',
              coverColor: AppColors.ebooks,
              pages: 156,
              language: 'English & Hindi',
              category: 'Medical Imaging',
              onRead: () => _openBook(context, 'ct_scan_guide'),
              onDownload: () => _downloadBook(context, 'ct_scan_guide'),
            ),
            
            const SizedBox(height: 16),
            
            // Diabetes Reversal
            EbookCard(
              title: AppStrings.diabetesReversal,
              author: AppStrings.doctorName,
              description: 'Evidence-based approach to reversing diabetes through integrative medicine, lifestyle changes, and natural therapies.',
              coverColor: AppColors.primary,
              pages: 234,
              language: 'English & Hindi',
              category: 'Diabetes Care',
              onRead: () => _openBook(context, 'diabetes_reversal'),
              onDownload: () => _downloadBook(context, 'diabetes_reversal'),
            ),
            
            const SizedBox(height: 16),
            
            // Brain aur Bramhand
            EbookCard(
              title: AppStrings.brainBramhand,
              author: AppStrings.doctorName,
              description: 'Exploring the connection between consciousness, brain function, and the universe through ancient wisdom and modern science.',
              coverColor: AppColors.accent,
              pages: 189,
              language: 'Hindi',
              category: 'Consciousness Studies',
              onRead: () => _openBook(context, 'brain_bramhand'),
              onDownload: () => _downloadBook(context, 'brain_bramhand'),
            ),
            
            const SizedBox(height: 16),
            
            // 5D Integrative Medicine
            EbookCard(
              title: AppStrings.integrativeMedicine,
              author: AppStrings.doctorName,
              description: 'Revolutionary approach combining Ayurveda, Naturopathy, Acupuncture, Modern Medicine, and Spiritual healing for complete wellness.',
              coverColor: AppColors.naturopathy,
              pages: 312,
              language: 'English & Hindi',
              category: 'Integrative Medicine',
              onRead: () => _openBook(context, '5d_integrative'),
              onDownload: () => _downloadBook(context, '5d_integrative'),
            ),
            
            const SizedBox(height: 24),
            
            // Reading Statistics
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
                    'Reading Benefits',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatItem('📚', '4 Books', 'Available'),
                      ),
                      Expanded(
                        child: _buildStatItem('🆓', 'Free', 'Download'),
                      ),
                      Expanded(
                        child: _buildStatItem('📱', 'Offline', 'Reading'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String emoji, String value, String label) {
    return Column(
      children: [
        Text(
          emoji,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textTertiary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  void _openBook(BuildContext context, String bookId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening book: $bookId'),
        backgroundColor: AppColors.ebooks,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _downloadBook(BuildContext context, String bookId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading book: $bookId'),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _downloadAllBooks(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Downloading all books...'),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}


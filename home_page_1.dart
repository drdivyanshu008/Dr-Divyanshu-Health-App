import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../widgets/module_tile.dart';
import '../widgets/greeting_header.dart';
import '../../../consultation/presentation/pages/consultation_booking_page.dart';
import '../../../ayurveda/presentation/pages/ayurveda_page.dart';
import '../../../naturopathy/presentation/pages/naturopathy_page.dart';
import '../../../ebooks/presentation/pages/ebooks_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            // Greeting Header
            const GreetingHeader(),
            
            // Module Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                  children: [
                    ModuleTile(
                      title: AppStrings.consultationBooking,
                      description: AppStrings.consultationDesc,
                      icon: Icons.medical_services,
                      color: AppColors.consultation,
                      onTap: () => _navigateToModule(context, 'consultation'),
                    ),
                    ModuleTile(
                      title: AppStrings.ayurvedaHealing,
                      description: AppStrings.ayurvedaDesc,
                      icon: Icons.local_florist,
                      color: AppColors.ayurveda,
                      onTap: () => _navigateToModule(context, 'ayurveda'),
                    ),
                    ModuleTile(
                      title: AppStrings.naturopathyMudra,
                      description: AppStrings.naturopathyDesc,
                      icon: Icons.back_hand,
                      color: AppColors.naturopathy,
                      onTap: () => _navigateToModule(context, 'naturopathy'),
                    ),
                    ModuleTile(
                      title: AppStrings.acupunctureChinese,
                      description: AppStrings.acupunctureDesc,
                      icon: Icons.healing,
                      color: AppColors.acupuncture,
                      onTap: () => _navigateToModule(context, 'acupuncture'),
                    ),
                    ModuleTile(
                      title: AppStrings.nutritionLifestyle,
                      description: AppStrings.nutritionDesc,
                      icon: Icons.restaurant,
                      color: AppColors.nutrition,
                      onTap: () => _navigateToModule(context, 'nutrition'),
                    ),
                    ModuleTile(
                      title: AppStrings.yogaMeditation,
                      description: AppStrings.yogaDesc,
                      icon: Icons.self_improvement,
                      color: AppColors.yoga,
                      onTap: () => _navigateToModule(context, 'yoga'),
                    ),
                    ModuleTile(
                      title: AppStrings.beautyTrichology,
                      description: AppStrings.beautyDesc,
                      icon: Icons.face,
                      color: AppColors.beauty,
                      onTap: () => _navigateToModule(context, 'beauty'),
                    ),
                    ModuleTile(
                      title: AppStrings.ksharaSutra,
                      description: AppStrings.ksharaDesc,
                      icon: Icons.local_hospital,
                      color: AppColors.surgery,
                      onTap: () => _navigateToModule(context, 'surgery'),
                    ),
                    ModuleTile(
                      title: AppStrings.ebooks,
                      description: AppStrings.ebooksDesc,
                      icon: Icons.menu_book,
                      color: AppColors.ebooks,
                      onTap: () => _navigateToModule(context, 'ebooks'),
                    ),
                    ModuleTile(
                      title: AppStrings.healthTips,
                      description: AppStrings.healthTipsDesc,
                      icon: Icons.tips_and_updates,
                      color: AppColors.healthTips,
                      onTap: () => _navigateToModule(context, 'health_tips'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToModule(context, 'consultation'),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.phone, color: AppColors.textPrimary),
      ),
    );
  }

  void _navigateToModule(BuildContext context, String module) {
    switch (module) {
      case 'consultation':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ConsultationBookingPage(),
          ),
        );
        break;
      case 'ayurveda':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AyurvedaPage(),
          ),
        );
        break;
      case 'naturopathy':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const NaturopathyPage(),
          ),
        );
        break;
      case 'ebooks':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const EbooksPage(),
          ),
        );
        break;
      default:
        // For other modules, show a snackbar for now
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Opening $module module...'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
    }
  }
}


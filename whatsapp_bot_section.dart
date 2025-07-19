import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class WhatsAppBotSection extends StatelessWidget {
  const WhatsAppBotSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'WhatsApp Bot Integration',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        const SizedBox(height: 8),
        
        Text(
          'Contact our specialized bots for instant assistance',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Main Health Bot
        _buildWhatsAppBotCard(
          context,
          title: 'Main Health Bot',
          subtitle: 'General health queries & guidance',
          phoneNumber: AppStrings.mainHealthBot,
          icon: Icons.health_and_safety,
          color: AppColors.primary,
        ),
        
        const SizedBox(height: 12),
        
        // OPD Booking Bot
        _buildWhatsAppBotCard(
          context,
          title: 'OPD Booking Bot',
          subtitle: 'Appointment scheduling & booking',
          phoneNumber: AppStrings.opdBookingBot,
          icon: Icons.calendar_today,
          color: AppColors.accent,
        ),
      ],
    );
  }

  Widget _buildWhatsAppBotCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String phoneNumber,
    required IconData icon,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () => _launchWhatsApp(context, phoneNumber),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // WhatsApp Icon Container
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF25D366).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF25D366).withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.chat,
                color: Color(0xFF25D366),
                size: 24,
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Bot Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    phoneNumber,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            
            // Arrow Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: color,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchWhatsApp(BuildContext context, String phoneNumber) async {
    // Remove any non-digit characters and format for WhatsApp
    final cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    final whatsappUrl = 'https://wa.me/$cleanNumber?text=Hello, I would like to book a consultation with Dr. Divyanshu.';
    
    try {
      final uri = Uri.parse(whatsappUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not open WhatsApp. Please install WhatsApp or call $phoneNumber'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error opening WhatsApp: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }
}


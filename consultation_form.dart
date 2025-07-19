import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../consultation/data/models/consultation_model.dart';

class ConsultationForm extends StatefulWidget {
  const ConsultationForm({super.key});

  @override
  State<ConsultationForm> createState() => _ConsultationFormState();
}

class _ConsultationFormState extends State<ConsultationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  
  String _selectedGender = '';
  String _selectedConsultationType = 'Online';
  final List<String> _selectedConditions = [];
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  
  final List<String> _medicalConditions = [
    AppStrings.ksharSutra,
    AppStrings.diabetes,
    AppStrings.kidney,
    AppStrings.thyroid,
    AppStrings.pcos,
    AppStrings.skin,
    AppStrings.obesity,
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.borderLight,
          width: 1,
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Information',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Name Field
            _buildTextField(
              controller: _nameController,
              label: AppStrings.name,
              icon: Icons.person,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.nameRequired;
                }
                return null;
              },
            ),
            
            const SizedBox(height: 16),
            
            // Phone Field
            _buildTextField(
              controller: _phoneController,
              label: AppStrings.phone,
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.phoneRequired;
                }
                if (value.length < 10) {
                  return AppStrings.invalidPhone;
                }
                return null;
              },
            ),
            
            const SizedBox(height: 16),
            
            // Email Field
            _buildTextField(
              controller: _emailController,
              label: AppStrings.email,
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.emailRequired;
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return AppStrings.invalidEmail;
                }
                return null;
              },
            ),
            
            const SizedBox(height: 16),
            
            // Age and Gender Row
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: _ageController,
                    label: AppStrings.age,
                    icon: Icons.cake,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.ageRequired;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildGenderDropdown(),
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Medical Conditions
            _buildMedicalConditionsSection(),
            
            const SizedBox(height: 20),
            
            // Consultation Type
            _buildConsultationTypeSection(),
            
            const SizedBox(height: 20),
            
            // Date and Time
            _buildDateTimeSection(),
            
            const SizedBox(height: 24),
            
            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Submit Consultation Request',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(color: AppColors.textPrimary),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.primary),
        filled: true,
        fillColor: AppColors.surfaceDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedGender.isEmpty ? null : _selectedGender,
      decoration: InputDecoration(
        labelText: AppStrings.gender,
        prefixIcon: const Icon(Icons.person_outline, color: AppColors.primary),
        filled: true,
        fillColor: AppColors.surfaceDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
      ),
      dropdownColor: AppColors.surfaceDark,
      style: const TextStyle(color: AppColors.textPrimary),
      items: [AppStrings.male, AppStrings.female, AppStrings.other]
          .map((gender) => DropdownMenuItem(
                value: gender,
                child: Text(gender),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedGender = value ?? '';
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.genderRequired;
        }
        return null;
      },
    );
  }

  Widget _buildMedicalConditionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.medicalCondition,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _medicalConditions.map((condition) {
            final isSelected = _selectedConditions.contains(condition);
            return FilterChip(
              label: Text(condition),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedConditions.add(condition);
                  } else {
                    _selectedConditions.remove(condition);
                  }
                });
              },
              backgroundColor: AppColors.surfaceDark,
              selectedColor: AppColors.primary.withOpacity(0.3),
              labelStyle: TextStyle(
                color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
              ),
              side: BorderSide(
                color: isSelected ? AppColors.primary : AppColors.borderLight,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildConsultationTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.consultationType,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: const Text(AppStrings.online, style: TextStyle(color: AppColors.textPrimary)),
                value: AppStrings.online,
                groupValue: _selectedConsultationType,
                onChanged: (value) {
                  setState(() {
                    _selectedConsultationType = value ?? AppStrings.online;
                  });
                },
                activeColor: AppColors.primary,
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: const Text(AppStrings.offline, style: TextStyle(color: AppColors.textPrimary)),
                value: AppStrings.offline,
                groupValue: _selectedConsultationType,
                onChanged: (value) {
                  setState(() {
                    _selectedConsultationType = value ?? AppStrings.online;
                  });
                },
                activeColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDateTimeSection() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: _selectDate,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceDark,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: AppColors.primary),
                  const SizedBox(width: 12),
                  Text(
                    _selectedDate != null
                        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                        : AppStrings.date,
                    style: const TextStyle(color: AppColors.textPrimary),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: _selectTime,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceDark,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Row(
                children: [
                  const Icon(Icons.access_time, color: AppColors.primary),
                  const SizedBox(width: 12),
                  Text(
                    _selectedTime != null
                        ? _selectedTime!.format(context)
                        : AppStrings.time,
                    style: const TextStyle(color: AppColors.textPrimary),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primary,
              surface: AppColors.surfaceDark,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  Future<void> _selectTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primary,
              surface: AppColors.surfaceDark,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedConditions.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(AppStrings.conditionRequired),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }
      
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(AppStrings.dateRequired),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }
      
      if (_selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(AppStrings.timeRequired),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      // Create consultation model
      final consultation = ConsultationModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        phone: _phoneController.text,
        email: _emailController.text,
        age: int.parse(_ageController.text),
        gender: _selectedGender,
        medicalConditions: _selectedConditions,
        consultationType: _selectedConsultationType,
        date: _selectedDate!,
        time: _selectedTime!.format(context),
        createdAt: DateTime.now(),
      );

      // TODO: Submit to Google Sheets and show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Consultation request submitted successfully!'),
          backgroundColor: AppColors.success,
        ),
      );
      
      // Clear form
      _clearForm();
    }
  }

  void _clearForm() {
    _nameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _ageController.clear();
    setState(() {
      _selectedGender = '';
      _selectedConsultationType = 'Online';
      _selectedConditions.clear();
      _selectedDate = null;
      _selectedTime = null;
    });
  }
}


# Dr. Divyanshu – 5D Integrative Health Mobile App

A comprehensive health application integrating Ayurveda, Naturopathy, Acupuncture, Nutrition, and modern medical practices.

## 📱 App Overview

**Dr. Divyanshu – 5D Integrative Health** is a professional mobile application designed for public consultation, Ayurveda awareness, and free health education under the Late Sushma Devi Foundation.

### 🎯 Key Features

- **Dark Mode UI**: Professional medical interface with healing green accents
- **10 Health Modules**: Comprehensive coverage of integrative health practices
- **WhatsApp Bot Integration**: Direct consultation booking via WhatsApp
- **Google Sheets Integration**: Automatic data storage for consultations
- **E-Book Library**: Free access to Dr. Divyanshu's authored medical books
- **Offline Functionality**: Core features work without internet connection

## 🏥 Health Modules

### 1. 📋 Consultation Booking
- Online/Offline appointment scheduling
- WhatsApp bot integration (+91 9695570344, +91 7019620344)
- Patient information form with medical condition selection
- Google Sheets webhook for data storage

### 2. 🌿 Ayurveda Healing Zone
- Daily Routine (Dinacharya) guidance
- Seasonal Care (Ritucharya) recommendations
- Panchakarma therapy information
- Herbal remedies database

### 3. 🤲 Naturopathy & Mudra Therapy
- Disease-wise hand mudras with images
- Hydrotherapy treatments
- Earth therapy and mud treatments
- Sun therapy and light healing

### 4. 🎯 Acupuncture & Chinese Medicine
- Acupuncture point visual guide
- Sujok therapy techniques
- Scalp therapy methods
- Reflexology practices

### 5. 🍎 Nutrition & Lifestyle
- Monthly diet charts (Indian food-based)
- Food recommendations for specific conditions
- Cost-saving nutrition plans
- Lifestyle modification guidance

### 6. 🧘 Yoga & Meditation
- Guided yoga for diabetes, BP, thyroid, stress
- Meditation music and audio practices
- Breathing exercises (Pranayama)
- Mindfulness techniques

### 7. 💆 Beauty & Trichology
- Ayurvedic skin and hair treatments
- Anti-aging solutions
- Acne treatment protocols
- Hair fall prevention methods

### 8. 🏥 Kshara Sutra Surgery Zone
- Live surgical case studies
- Step-by-step procedure explanations
- Fistula, piles, fissure treatment information
- Ayurvedic surgery techniques

### 9. 📚 E-Book Section
Free download/view of authored books:
- **CT Scan Guide**: Comprehensive imaging interpretation
- **Diabetes Reversal**: Evidence-based reversal protocols
- **Brain aur Bramhand**: Consciousness and universe connection
- **5D Integrative Medicine**: Complete wellness approach

### 10. 💡 Daily Health Tips
- Push notifications for health reminders
- 5-minute morning health routines
- 5-minute evening wellness practices
- Rogmukt Bharat 2035 health tips

## 🛠️ Technical Specifications

### Framework & Architecture
- **Framework**: Flutter 3.5.4
- **Architecture**: Clean Architecture with BLoC pattern
- **State Management**: Flutter BLoC
- **Navigation**: Go Router
- **Local Storage**: Hive + Shared Preferences

### Backend Integration
- **API**: Flask backend with Google Sheets integration
- **Database**: SQLite for local storage
- **Cloud Storage**: Google Sheets for consultation data
- **Authentication**: JWT-based (ready for implementation)

### UI/UX Design
- **Theme**: Dark mode with healing green accents (#4CAF50)
- **Typography**: Roboto font family
- **Icons**: Material Design icons
- **Responsive**: Optimized for all screen sizes

## 🚀 Build Instructions

### Prerequisites
1. **Flutter SDK**: Version 3.5.4 or higher
2. **Android Studio**: Latest version with Android SDK
3. **Java**: JDK 11 or higher
4. **Git**: For version control

### Setup Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/DrDivyanshu/dr_divyanshu_health_app.git
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Android SDK**
   ```bash
   export ANDROID_HOME=C:/Users/YOUR_USERNAME/AppData/Local/Android/Sdk"
   export PATH=$PATH:$ANDROID_HOME/tools/latest/bin
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   ```

4. **Accept Android Licenses**
   ```bash
   flutter doctor --android-licenses
   ```

5. **Build APK**
   ```bash
   # Debug APK
   flutter build apk --debug
   
   # Release APK
   flutter build apk --release
   
   # Split APKs by ABI(for Play Store)
   flutter build apk --split-per-abi
   ```

6. **Build App Bundle (for Play Store)**
   ```bash
   flutter build appbundle --release
   ```

### Build Outputs
- **APK Location**: `build/app/outputs/flutter-apk/`
- **App Bundle Location**: `build/app/outputs/bundle/release/`

## 📦 Deployment Options

### 1. Direct APK Installation
- Share the APK file directly with users
- Enable "Install from Unknown Sources" on Android devices
- Suitable for beta testing and internal distribution

### 2. Google Play Store
- Upload the App Bundle (.aab file) to Google Play Console
- Complete store listing with screenshots and descriptions
- Follow Google Play policies for medical apps

### 3. Alternative App Stores
- Amazon Appstore
- Samsung Galaxy Store
- Huawei AppGallery

## 🔧 Backend Setup

### Flask Backend
The app includes a Flask backend for Google Sheets integration:

1. **Navigate to Backend Directory**
   ```bash
   cd ../dr_divyanshu_backend
   ```

2. **Activate Virtual Environment**
   ```bash
   source venv/bin/activate
   ```

3. **Install Dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Run Backend Server**
   ```bash
   python src/main.py
   ```

### Google Sheets Integration
1. Create a Google Cloud Project
2. Enable Google Sheets API
3. Create service account credentials
4. Update the credentials in the backend service
5. Share the Google Sheet with the service account email

## 📱 App Icon & Branding

### App Icon
- **Design**: Dr. Divyanshu profile with healing lotus symbol
- **Colors**: Dark background with green accents
- **Format**: PNG with multiple resolutions
- **Location**: `assets/icons/app_icon.png`

### Splash Screen
- **Background**: Dark charcoal (#1A1A1A)
- **Logo**: Healing lotus with golden highlights
- **Duration**: 2-3 seconds

## 🔐 Security Features

### Data Protection
- Local data encryption using Hive
- Secure API communication with HTTPS
- Patient data privacy compliance
- GDPR-ready data handling

### Authentication (Ready for Implementation)
- JWT-based authentication
- Biometric login support
- Session management
- Secure logout

## 📊 Analytics & Monitoring

### App Performance
- Crash reporting integration ready
- Performance monitoring setup
- User analytics tracking
- Health module usage statistics

### Medical Compliance
- HIPAA-ready architecture
- Patient data anonymization
- Audit trail capabilities
- Consent management system

## 🌐 Internationalization

### Language Support
- **Primary**: English
- **Secondary**: Hindi
- **Expandable**: Ready for additional languages
- **Location**: `lib/l10n/` (ready for implementation)

## 🧪 Testing

### Unit Tests
```bash
flutter test
```

### Integration Tests
```bash
flutter test integration_test/
```

### Widget Tests
```bash
flutter test test/widget_test.dart
```

## 📞 Support & Contact

### Dr. Divyanshu Patel
- **Phone**: +91 9695570344
- **Specialty**: 5D Integrative Health
- **Foundation**: Late Sushma Devi Foundation

### WhatsApp Bots
- **Main Health Bot**: +91 9695570344
- **OPD Booking Bot**: +91 7019620344

## 📄 License

This application is developed for the Late Sushma Devi Foundation for public health education and consultation services.

## 🔄 Version History

### Version 1.0.0
- Initial release with all 10 health modules
- Dark mode UI implementation
- WhatsApp bot integration
- Google Sheets backend integration
- E-book library with 4 authored books
- Consultation booking system

## 🚀 Future Enhancements

### Planned Features
1. **Video Consultations**: Integrated video calling
2. **AI Health Assistant**: Symptom checker and recommendations
3. **Prescription Management**: Digital prescription system
4. **Health Records**: Patient health history tracking
5. **Appointment Reminders**: SMS and push notifications
6. **Multi-language Support**: Regional language support
7. **Telemedicine Integration**: Full telemedicine platform
8. **Health Monitoring**: Integration with wearable devices

### Technical Improvements
1. **Offline Sync**: Enhanced offline functionality
2. **Performance Optimization**: Faster app loading
3. **Advanced Analytics**: Detailed usage insights
4. **Cloud Backup**: Patient data cloud synchronization
5. **API Optimization**: Improved backend performance

---

**Built with ❤️ for holistic health and wellness**

*Dr. Divyanshu – 5D Integrative Health*  
*Empowering health through ancient wisdom and modern science*


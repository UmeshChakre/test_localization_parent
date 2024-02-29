import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of AppLocalizationsClass
/// returned by `AppLocalizationsClass.of(context)`.
///
/// Applications need to include `AppLocalizationsClass.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizationsClass.localizationsDelegates,
///   supportedLocales: AppLocalizationsClass.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizationsClass.supportedLocales
/// property.
abstract class AppLocalizationsClass {
  AppLocalizationsClass(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizationsClass of(BuildContext context) {
    return Localizations.of<AppLocalizationsClass>(context, AppLocalizationsClass)!;
  }

  static const LocalizationsDelegate<AppLocalizationsClass> delegate = _AppLocalizationsClassDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh')
  ];

  /// No description provided for @parentOnly.
  ///
  /// In en, this message translates to:
  /// **'Parent ONLY STRING'**
  String get parentOnly;

  /// No description provided for @helloText.
  ///
  /// In en, this message translates to:
  /// **'Parent SDK'**
  String get helloText;

  /// No description provided for @helloText2.
  ///
  /// In en, this message translates to:
  /// **'Parent SDK'**
  String get helloText2;

  /// No description provided for @pleaseConfirm.
  ///
  /// In en, this message translates to:
  /// **'Parent SDK'**
  String get pleaseConfirm;

  /// No description provided for @newTransfer.
  ///
  /// In en, this message translates to:
  /// **'Parent SDK'**
  String get newTransfer;

  /// No description provided for @termsConditions.
  ///
  /// In en, this message translates to:
  /// **'Parent SDK'**
  String get termsConditions;

  /// No description provided for @termsConditionsUpper.
  ///
  /// In en, this message translates to:
  /// **'Parent SDK'**
  String get termsConditionsUpper;

  /// No description provided for @byClickingYesIAgreeToThe.
  ///
  /// In en, this message translates to:
  /// **'Parent SDK'**
  String get byClickingYesIAgreeToThe;

  /// No description provided for @getImageFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Parent AND RPP String'**
  String get getImageFromGallery;
}

class _AppLocalizationsClassDelegate extends LocalizationsDelegate<AppLocalizationsClass> {
  const _AppLocalizationsClassDelegate();

  @override
  Future<AppLocalizationsClass> load(Locale locale) {
    return SynchronousFuture<AppLocalizationsClass>(lookupAppLocalizationsClass(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsClassDelegate old) => false;
}

AppLocalizationsClass lookupAppLocalizationsClass(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsClassEn();
    case 'zh': return AppLocalizationsClassZh();
  }

  throw FlutterError(
    'AppLocalizationsClass.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

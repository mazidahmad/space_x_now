import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @rockets.
  ///
  /// In en, this message translates to:
  /// **'Rockets'**
  String get rockets;

  /// No description provided for @launches.
  ///
  /// In en, this message translates to:
  /// **'Launches'**
  String get launches;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @homeUpcomingLaunch.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Launch'**
  String get homeUpcomingLaunch;

  /// No description provided for @homeNoUpcomingLaunch.
  ///
  /// In en, this message translates to:
  /// **'No Upcoming Launch'**
  String get homeNoUpcomingLaunch;

  /// No description provided for @homeUpcomingCardLabelMissionName.
  ///
  /// In en, this message translates to:
  /// **'Mission Name'**
  String get homeUpcomingCardLabelMissionName;

  /// No description provided for @homeUpcomingCardLabelRocketName.
  ///
  /// In en, this message translates to:
  /// **'Rocket Name'**
  String get homeUpcomingCardLabelRocketName;

  /// No description provided for @homeUpcomingCardLabelFlightNumber.
  ///
  /// In en, this message translates to:
  /// **'Flight Number'**
  String get homeUpcomingCardLabelFlightNumber;

  /// No description provided for @homeUpcomingCardLabelTime.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get homeUpcomingCardLabelTime;

  /// No description provided for @homeUpcomingCardLabelLaunchpad.
  ///
  /// In en, this message translates to:
  /// **'Launchpad'**
  String get homeUpcomingCardLabelLaunchpad;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @specs.
  ///
  /// In en, this message translates to:
  /// **'Specs'**
  String get specs;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @propulsion.
  ///
  /// In en, this message translates to:
  /// **'Propulsion'**
  String get propulsion;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @noRocketFound.
  ///
  /// In en, this message translates to:
  /// **'No Rocket Found'**
  String get noRocketFound;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// No description provided for @launchCost.
  ///
  /// In en, this message translates to:
  /// **'Launch Cost'**
  String get launchCost;

  /// No description provided for @stages.
  ///
  /// In en, this message translates to:
  /// **'Stages'**
  String get stages;

  /// No description provided for @mass.
  ///
  /// In en, this message translates to:
  /// **'Mass'**
  String get mass;

  /// No description provided for @firstFlight.
  ///
  /// In en, this message translates to:
  /// **'First Flight'**
  String get firstFlight;

  /// No description provided for @sideBoosters.
  ///
  /// In en, this message translates to:
  /// **'Side Boosters'**
  String get sideBoosters;

  /// No description provided for @engineType.
  ///
  /// In en, this message translates to:
  /// **'Engine Type'**
  String get engineType;

  /// No description provided for @seaLevelThrust.
  ///
  /// In en, this message translates to:
  /// **'Sea Level Thrust'**
  String get seaLevelThrust;

  /// No description provided for @propellant1.
  ///
  /// In en, this message translates to:
  /// **'Propellant #1'**
  String get propellant1;

  /// No description provided for @propellant2.
  ///
  /// In en, this message translates to:
  /// **'Propellant #2'**
  String get propellant2;

  /// No description provided for @engineCount.
  ///
  /// In en, this message translates to:
  /// **'Engine Count'**
  String get engineCount;

  /// No description provided for @vacuumThrust.
  ///
  /// In en, this message translates to:
  /// **'Vacuum Thrust'**
  String get vacuumThrust;

  /// No description provided for @maxEngineLoss.
  ///
  /// In en, this message translates to:
  /// **'Max Engine Loss'**
  String get maxEngineLoss;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @selectYourPreferredLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language'**
  String get selectYourPreferredLanguage;

  /// No description provided for @filterRockets.
  ///
  /// In en, this message translates to:
  /// **'Filter Rockets'**
  String get filterRockets;

  /// No description provided for @allStatus.
  ///
  /// In en, this message translates to:
  /// **'All Status'**
  String get allStatus;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

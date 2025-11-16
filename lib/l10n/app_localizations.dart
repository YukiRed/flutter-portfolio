import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_zh.dart';

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
    Locale('ms'),
    Locale('zh'),
  ];

  /// Application title shown in window title / browser tab.
  ///
  /// In en, this message translates to:
  /// **'Desmond Liew — Portfolio'**
  String get appTitle;

  /// Top navigation: link to the home page.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// Top navigation: link to the projects listing.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get navProjects;

  /// Top navigation: link to the blog index.
  ///
  /// In en, this message translates to:
  /// **'Blog'**
  String get navBlog;

  /// Top navigation: link to the labs index.
  ///
  /// In en, this message translates to:
  /// **'Labs'**
  String get navLabs;

  /// Top navigation: link to the library / learning archive.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get navLibrary;

  /// Top navigation: label for the Discover menu (blog, library, people).
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get navDiscover;

  /// Top navigation: link to the philosophy/meta realm.
  ///
  /// In en, this message translates to:
  /// **'Philosophy'**
  String get navPhilosophy;

  /// Top navigation: link to the foundation section.
  ///
  /// In en, this message translates to:
  /// **'Foundation'**
  String get navFoundation;

  /// Top navigation: link to the timeline page.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get navTimeline;

  /// Top navigation: link to the services page.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get navServices;

  /// Top navigation: link to the resume/CV page.
  ///
  /// In en, this message translates to:
  /// **'Résumé'**
  String get navResume;

  /// Top navigation: link to the login/unlock page.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get navLogin;

  /// Top navigation: label for the Work menu (projects, labs, products).
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get navWork;

  /// Top navigation: label for the About menu.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get navAbout;

  /// Top navigation: link to the people index.
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get navPeople;

  /// Top navigation: link to the credits/thanks page.
  ///
  /// In en, this message translates to:
  /// **'Credits'**
  String get navCredits;

  /// Top navigation or drawer: button to log out / clear passphrase.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get navLogout;

  /// Navigation label for Contact page
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// Tooltip/title for the theme popup menu.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get menuTheme;

  /// Label inside theme popup for choosing light/dark/system.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get menuThemeMode;

  /// Theme mode: follow the device/system setting.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// Theme mode: light theme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// Theme mode: dark theme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// Label for choosing a color palette.
  ///
  /// In en, this message translates to:
  /// **'Palette'**
  String get menuPalette;

  /// Name of the 'metal' color palette.
  ///
  /// In en, this message translates to:
  /// **'Metal'**
  String get paletteMetal;

  /// Name of the 'earth' color palette.
  ///
  /// In en, this message translates to:
  /// **'Earth'**
  String get paletteEarth;

  /// Name of the 'wood' color palette.
  ///
  /// In en, this message translates to:
  /// **'Wood'**
  String get paletteWood;

  /// Name of the 'fire' color palette.
  ///
  /// In en, this message translates to:
  /// **'Fire'**
  String get paletteFire;

  /// Name of the 'water' color palette.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get paletteWater;

  /// Tooltip/title for the language selection popup.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get menuLanguage;

  /// Language choice: English.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get langEnglish;

  /// Language choice: Chinese.
  ///
  /// In en, this message translates to:
  /// **'中文'**
  String get langChinese;

  /// Language choice: Malay.
  ///
  /// In en, this message translates to:
  /// **'Bahasa Melayu'**
  String get langMalay;

  /// Tagline shown on the home page hero.
  ///
  /// In en, this message translates to:
  /// **'Applied AI Engineer · System Architect'**
  String get homeTagline;

  /// Headline on the login/unlock page.
  ///
  /// In en, this message translates to:
  /// **'Enter passphrase to unlock private content'**
  String get authUnlockTitle;

  /// Label for the passphrase text field.
  ///
  /// In en, this message translates to:
  /// **'Passphrase'**
  String get authPassphraseLabel;

  /// Button label to unlock private content.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get authUnlockButton;

  /// Title shown when the user is already authenticated.
  ///
  /// In en, this message translates to:
  /// **'You are logged in.'**
  String get authAlreadyLoggedInTitle;

  /// Body text explaining that private items are visible and passphrase is stored locally.
  ///
  /// In en, this message translates to:
  /// **'Private items are visible.\nThis passphrase is stored locally until you log out.'**
  String get authAlreadyLoggedInBody;

  /// Snackbar message when passphrase validation fails.
  ///
  /// In en, this message translates to:
  /// **'Wrong passphrase'**
  String get authWrongPassphrase;

  /// Snackbar message when unlocking succeeds.
  ///
  /// In en, this message translates to:
  /// **'Unlocked — private content will be shown.'**
  String get authUnlockSuccess;

  /// Small helper text on the login page explaining the canary mechanism.
  ///
  /// In en, this message translates to:
  /// **'Tip: You can add an optional canary in .env to validate the passphrase immediately.'**
  String get authCanaryTip;

  /// Title on the lock banner when content is private.
  ///
  /// In en, this message translates to:
  /// **'This content is private.'**
  String get lockPrivateTitle;

  /// Subtitle on the lock banner explaining the need to log in.
  ///
  /// In en, this message translates to:
  /// **'Log in with passphrase to view the content.'**
  String get lockPrivateSubtitle;

  /// Button label on lock banner to navigate to the login page.
  ///
  /// In en, this message translates to:
  /// **'Go to Login'**
  String get lockGoToLogin;

  /// Badge label indicating content is private.
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get visibilityPrivate;

  /// Badge label indicating content is public.
  ///
  /// In en, this message translates to:
  /// **'Public'**
  String get visibilityPublic;

  /// Main text for generic 404 page.
  ///
  /// In en, this message translates to:
  /// **'404 — Not Found'**
  String get notFound404;

  /// Generic 'not found' message for various detail pages.
  ///
  /// In en, this message translates to:
  /// **'Not found'**
  String get notFoundGeneric;

  /// Message when a page slug is not found.
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get notFoundPage;

  /// Message shown when the meta realm/section has been disabled in config.
  ///
  /// In en, this message translates to:
  /// **'Meta realm is disabled.'**
  String get metaDisabled;

  /// Main title for the Work index page.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get workSectionTitle;

  /// Subtitle for the Work index page.
  ///
  /// In en, this message translates to:
  /// **'Projects and Lab Experiments'**
  String get workSectionSubtitle;

  /// Work filter label: show all work items.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get workFilterAll;

  /// Work filter label: show projects only.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get workFilterProjects;

  /// Work filter label: show lab items only.
  ///
  /// In en, this message translates to:
  /// **'Labs'**
  String get workFilterLabs;

  /// Work filter label: show product/template items only.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get workFilterProducts;

  /// Message shown when there are no work items.
  ///
  /// In en, this message translates to:
  /// **'No items yet.'**
  String get workEmpty;

  /// Subtitle for the Blog index page.
  ///
  /// In en, this message translates to:
  /// **'Applied notes on engineering, evaluation, and calm systems.'**
  String get blogSectionSubtitle;

  /// Message shown when there are no blog posts.
  ///
  /// In en, this message translates to:
  /// **'No blog posts yet.'**
  String get blogEmpty;

  /// Blog filter label: show all posts.
  ///
  /// In en, this message translates to:
  /// **'All posts'**
  String get blogFilterAll;

  /// Subtitle for the Library index page.
  ///
  /// In en, this message translates to:
  /// **'Inputs to my thinking: readings, tools, press, and research notes.'**
  String get librarySectionSubtitle;

  /// Message shown when there are no library items.
  ///
  /// In en, this message translates to:
  /// **'No library entries yet.'**
  String get libraryEmpty;

  /// Library filter label: show all entries.
  ///
  /// In en, this message translates to:
  /// **'All entries'**
  String get libraryFilterAll;

  /// Subtitle for the People index page.
  ///
  /// In en, this message translates to:
  /// **'The thinkers, mentors, and influences behind my work.'**
  String get peopleSectionSubtitle;

  /// Message shown when there are no people profiles.
  ///
  /// In en, this message translates to:
  /// **'No people profiles yet.'**
  String get peopleEmpty;

  /// People filter label: show all profiles.
  ///
  /// In en, this message translates to:
  /// **'All people'**
  String get peopleFilterAll;

  /// Subtitle for the philosophy/meta index page.
  ///
  /// In en, this message translates to:
  /// **'Inner operating system: mind, body, ethics, archetypes, practice.'**
  String get philosophySectionSubtitle;

  /// Message shown when there are no philosophy notes.
  ///
  /// In en, this message translates to:
  /// **'No philosophy notes are published yet.'**
  String get philosophyEmpty;

  /// Subtitle for the timeline page header.
  ///
  /// In en, this message translates to:
  /// **'Milestones & significant updates'**
  String get timelineSubtitle;

  /// Message shown when there are no timeline entries.
  ///
  /// In en, this message translates to:
  /// **'No timeline entries yet.'**
  String get timelineEmpty;

  /// Subtitle shown under Contact page header
  ///
  /// In en, this message translates to:
  /// **'Get in touch'**
  String get contactSectionSubtitle;

  /// Intro paragraph at top of Contact page
  ///
  /// In en, this message translates to:
  /// **'I read my own email and prefer calm, direct communication. Whether you’re exploring a project, inviting a talk, or just want to discuss an idea, a short message with context is the best place to start.'**
  String get contactIntro;

  /// Title for main contact card
  ///
  /// In en, this message translates to:
  /// **'Primary contact'**
  String get contactPrimaryTitle;

  /// Description explaining how people should contact you
  ///
  /// In en, this message translates to:
  /// **'For most things — consulting, collaborations, questions about my work — email is the simplest way to reach me. If a live conversation is easier, you can book a short call instead.'**
  String get contactPrimaryDescription;

  /// Button label for email address
  ///
  /// In en, this message translates to:
  /// **'hello@desmondliew.dev'**
  String get contactPrimaryButtonEmail;

  /// Button label for scheduling a call via Calendly
  ///
  /// In en, this message translates to:
  /// **'Schedule a 15-minute call'**
  String get contactPrimaryButtonCall;

  /// Language availability display
  ///
  /// In en, this message translates to:
  /// **'Languages: English · 中文 · Bahasa Malaysia'**
  String get contactPrimaryLanguages;

  /// Label for office hours section
  ///
  /// In en, this message translates to:
  /// **'Office hours'**
  String get contactOfficeHoursLabel;

  /// Value for office hours
  ///
  /// In en, this message translates to:
  /// **'Mon – Fri · 9:00 – 15:00'**
  String get contactOfficeHoursValue;

  /// Label for timezone
  ///
  /// In en, this message translates to:
  /// **'Timezone'**
  String get contactTimezoneLabel;

  /// Displayed timezone
  ///
  /// In en, this message translates to:
  /// **'Malaysia / Singapore (GMT+8)'**
  String get contactTimezoneValue;

  /// Expected response time
  ///
  /// In en, this message translates to:
  /// **'Typical response: within 1–2 days'**
  String get contactResponseTime;

  /// Title for privacy and boundaries section
  ///
  /// In en, this message translates to:
  /// **'Privacy & boundaries'**
  String get contactPrivacyTitle;

  /// General privacy guarantee statement
  ///
  /// In en, this message translates to:
  /// **'I handle all communication personally and keep messages private. I never share emails or details with third parties.'**
  String get contactPrivacyNote;

  /// Warning to avoid sending sensitive data
  ///
  /// In en, this message translates to:
  /// **'For first contact, high-level descriptions are enough. Please avoid sending sensitive personal details or confidential client data in the initial email.'**
  String get contactPrivacyWarning;

  /// Ethical boundaries for unacceptable work
  ///
  /// In en, this message translates to:
  /// **'I don’t take on work involving surveillance tooling, dark patterns, or undisclosed data scraping.'**
  String get contactPrivacyEthics;

  /// Title for testimonials card
  ///
  /// In en, this message translates to:
  /// **'Testimonials'**
  String get testimonialsSectionTitle;

  /// Subtitle for testimonials card
  ///
  /// In en, this message translates to:
  /// **'Notes from collaborators and clients'**
  String get testimonialsSectionSubtitle;

  /// Description explaining what testimonials contain
  ///
  /// In en, this message translates to:
  /// **'If you want to understand how I work with teams, you can read a few short notes from collaborators and clients.'**
  String get contactTestimonialDescription;

  /// Button to open testimonials page
  ///
  /// In en, this message translates to:
  /// **'View testimonials'**
  String get contactTestimonialButton;

  /// Title for accessibility notes
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get contactAccessibilityTitle;

  /// Accessibility statement for communication
  ///
  /// In en, this message translates to:
  /// **'If you have specific accessibility needs for communication — for example, written-only, captions for calls, or alternative tools — mention it in your message. I will adapt where I can.'**
  String get contactAccessibilityNote;
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
      <String>['en', 'ms', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ms':
      return AppLocalizationsMs();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

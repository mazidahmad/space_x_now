class ApiUrl {
  static const String version = '/v1';
  static const String version2 = '/v2';
  static const String mosy = '$version/mosy';
  static const String mosyV2 = '$version2/mosy';

  // Company
  static const String companies = '/companies';
  static const String verifyCompany = '$companies/verify-access';
  static String verifyCompanyCode(String code) =>
      '$verifyCompany/$code/wemind_mosy';

  // Accounts
  static const String accounts = '$version/accounts';
  static const String signIn = '$accounts/sign-in';
  static const String signUp = '$accounts/sign-up';
  static const String verifyAccount = '$accounts/verify';
  static const String verifyOtp = '$verifyAccount/otp';
  static const String verifyEmailWithOTP = '$verifyOtp/email';
  static const String otp = '$accounts/otp';
  static const String otpCognito = '$otp/cognito';
  static const String otpVerify = '$otp/verify';
  static const String me = '$accounts/me';
  static const String refreshToken = '$accounts/refresh-token';
  static const String changePassword = '$me/change-password';

  // Therapist
  static const String therapists = '/therapists';
  static String therapistAvailability(String therapistId) =>
      '$therapists/$therapistId/availability';
  static String therapistCalendar(String therapistId) =>
      '$therapists/$therapistId/calendar';

  // Session
  static const String session = '/session';
  static const String sessionAppointment = '$session/appointment';
  static String joinSession(String sessionId) => '$session/$sessionId/join';
  static String sessionByUser(String userId) => '$session/$userId';
  static String onGoingSession(String userId) =>
      '${sessionByUser(userId)}/on-going';
  static const String cancelSession = '$sessionAppointment/cancel';

  // User Management
  static const String userManagement = '/user-management';
  static const String userCognito = '$userManagement/cognito';
  static const String mosyCLient = '$mosy/client';

  // growths
  static const String growths = '/growths';

  // relaxes
  static const String relaxes = '/relaxes';

  // guides
  static const String guides = '/guides';

  // moods
  static const String moods = '/moods';

  // quotes
  static const String quotes = '/quotes';

  // moods
  static const String mood = '/mood';
  static const String quotesByMood = '$quotes$mood';
  static const String checkToday = '/check-todays';

  // moods
  static const String personalized = '/personalized';

  // Notifications
  static const String notification = '/notification';
  // favorites
  static const String favorites = '/favorites';

  // Self Test
  static const String selfTest = '/self-test';
  static const String user = '/user';
  static const String selfTestQuestion = '$selfTest/question';
  static const String selfTestAnswer = '$selfTest$user/answer';
  static const String selfTestResult = '$selfTest$user/result';
  static const String selfTestExist = '$selfTest/exists';

  // Chat
  static const String chat = '/chats';
  static const String findChatTherapist = '$chat$therapists/find';
  static const String chatHistory = '$chat/history';
  static const String chatV2 = '$mosyV2/chats';
  static const String startChat = '$chatV2/start';
  static const String chatV2History = '$chatV2/history';
  static String chatMessages(String conversationId) =>
      '$chatV2/$conversationId/messages';

  // Diary
  static const String diary = '/diaries';
  static const String diaryPinCode = '$diary/pin-code';
  static const String diaryVerifyPinCode = '$diary/verify/pin-code';
  static const String diaryUser = '$diary/user';
  static const String diaryGroup = '$diary/group';

  // Journey
  static const String journey = '/journey';

  // Account
  static const String account = '$version/accounts';
  static String checkLicense(String cognitoId) =>
      '$account/$cognitoId/check-license';

  // Questionnaire
  static const String questionnaire = '$mosy/questionnaire';
  static const String questionnaireHistory = '$questionnaire/history';
  static const String questionnaireStatus = '$questionnaire/last-submit/status';

  // Personalization
  static const String personalization = '$mosy/personal';
  static const String personalGrowth = '$personalization/growths';
  static const String personalRelax = '$personalization/relaxes';
  static const String personalTherapist = '$personalization/therapists';

  // Realtime
  static const String realtime = '/api/realtime/v1/mosy';
  static const String realtimeChat = '$realtime/chats';

  static const String forgotPassword = '$accounts/forgot-password';
  static const String forgotPasswordOtpEmail = '$accounts/otp/email';
  static const String forgotPasswordConfirm = '$forgotPassword/confirm';
}

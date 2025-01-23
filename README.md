
To generate translation files, in terminal run: `flutter gen-l10n --arb-dir assets/l10n`

To generate api client (retrofit), in terminal run: `flutter pub run build_runner build`

To generate json serializers, in terminal run:`dart run build_runner build`

Technical Application Specification
1. Project Overview
The mobile application is a tourist guide app where users can discover and save their favorite sights. The application will support both Android and iOS platforms, developed in Flutter, with a backend built using Kotlin Spring. The app will interact with a REST API for fetching data and will store some information locally. Key features include user authentication, sight browsing, favorite sight management, and settings customization.
 
2. Core Functionalities

 2.1 User Authentication
 •	Splash Screen:
 o	Purpose: Loads initial user data (e.g., authentication status).
 o	Behaviors:
 	Checks if the user is authenticated.
 	Redirects either to the Home Screen (if authenticated) or Sign In Screen (if not authenticated).
 •	Sign In Screen:
 o	Purpose: Authenticates the user with email and password.
 o	Input Fields:
 	Email (validated for correct format).
 	Password (validated for complexity, e.g., min 8 characters, includes letters and numbers).
 o	Actions:
 	Sign In button: Authenticates via REST API.
 	Redirect to Sign Up Screen on user interaction.
 •	Sign Up Screen:
 o	Purpose: Allows users to register a new account.
 o	Input Fields:
 	Email (validated for correct format).
 	Password (validated for complexity).
 	Confirm password (same validation rule, do passwords match)
 o	Actions:
 	Sign Up button: Registers the user via REST API.
 	Redirect to Home screen after successful registration.
   
2.2 Home Screen
•	Bottom Navigation Bar:
o	Contains 3 tabs:
	Sights (default).
	Favorites.
	Settings.

 2.2.1 Sights Tab
 •	API Integration:
 o	Fetches a list of sights from the REST API.
 •	States:
 o	Loading: Shows a loading spinner while the API is fetching data.
 o	Empty: Displays a message when there are no sights available.
 o	Error: Displays an error message if the API call fails.
 o	Filled: Displays a list of sight cards when the API successfully returns data.
 •	Sight Cards:
 o	Information: Each card displays sight name, image, address, rating and a favorite state as heart button icon.
 o	Actions:
 	Favorite Button: Tapping the heart icon marks/unmarks the sight as a favorite.
 	Card Tap: Redirects to Sight Details Screen.
 
 2.2.2 Sight Details Screen
 Displays: Detailed information about the selected sight (name, image, description).
 •	Actions:
 o	Favorite Button: Allows marking/unmarking the sight as a favorite.
 o	Open in Maps: A button at the bottom of the screen that opens the sight's location in the device's default map app (Google Maps for Android, Apple Maps for iOS).
 
 2.2.3 Favorites Tab
 •	Local Storage Integration:
 o	The list of favorite sights is stored locally.
 o	Displays the same sight cards as in the Sights Tab.
 •	States:
 o	Loading: Shows while fetching favorite sights from local storage.
 o	Success: Displays a list of favorited sights.
 o	Empty: Displays a message when no sights are marked as favorites.
 
 2.2.4 Settings Tab
 •	User Information:
 o	Displays the currently logged-in user’s email address.
 •	Actions:
 o	Sign Out: Logs the user out and redirects to the Sign In screen.
  


3. Backend Integration
•	Authentication:
o	The app will use the backend API (Firebase Auth) for authentication (sign-in, sign-up).
•	Sights API:
o	The app will fetch the list of sights via the REST API (Kotlin Spring).
•	Favorites Management:
o	The app will manage favoriting/unfavoriting via local storage.

 
4. Non-Functional Requirements
•	Platform Compatibility:
o	The app must work on both Android (min SDK 21) and iOS (min version 12.0).
•	Performance:
o	The app should have smooth navigation and loading indicators for API responses.
•	Offline Access:
o	The favorite sights list should be available even when the user is offline, using local storage.

 
5. Design & UX
•	Design Files:
o	All screens will follow the provided design in Figma, ensuring consistent UI/UX.
•	Responsiveness:
o	The app must handle different screen sizes across devices.
 


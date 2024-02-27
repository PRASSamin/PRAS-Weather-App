==============================
Setting Up OpenWeatherMap API
==============================

To use the code, you need to obtain an API key from OpenWeatherMap and configure it in your Flutter project. Follow the steps below to collect your API key and set it up properly:

1. Sign Up/Login to OpenWeatherMap:
   - If you haven't already, sign up for an account on the OpenWeatherMap website: https://home.openweathermap.org/users/sign_up
   - If you already have an account, log in using your credentials.

2. Generate API Key:
   - After logging in, click on your profile icon/name to open the drop-down menu.
   - Select "My API keys" from the menu.
   - If you don't have an API key yet, click on the "Generate" button to create a new API key.
   - Copy the generated API key. This key will be used to authenticate your requests to the OpenWeatherMap API.

3. Configure API Key in Flutter Project:
   - Clone or download the PRAS Weather App project from GitHub: https://github.com/PRASSamin/PRAS-Weather-App/
   - Open the project in your preferred code editor.

4. Set API Key in getData.dart:
   - In the project directory, navigate to the lib/helper/getData.dart file.
   - Add your OpenWeatherMap API key to the getData.dart file using the following format:
     String apiKey = "YOUR_API_KEY";
     Replace YOUR_API_KEY with the API key you obtained in step 2.

5. Save Changes and Run the App:
   - Save the changes to the getData.dart file.
   - Build and run the Your Weather App using Flutter.
   - Ensure that the app fetches weather data properly without any errors.

Note: If you plan to distribute your own version of the app built with this code, please obtain your own API key from OpenWeatherMap. Users who build their own version of the app should also use their own API key to ensure proper functioning.

By following these steps, you'll be able to collect your API key from OpenWeatherMap and set it up in the PRAS Weather App project. If you encounter any issues or have questions, feel free to reach out for assistance.

Happy coding!


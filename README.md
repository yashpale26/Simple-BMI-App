Simple BMI App ⚖️
A sleek, responsive BMI (Body Mass Index) calculator built with Flutter. This app features dynamic UI changes based on user health metrics and utilizes the elegant Lobster Two typography for a premium look and feel.

<img width="300" height="600" alt="image" src="https://github.com/user-attachments/assets/7ad9b2f8-2154-4a80-bd2f-eb1c52dc1393" />
<img width="300" height="600" alt="image" src="https://github.com/user-attachments/assets/967d8ff2-fba4-484b-b5e7-878e696390f9" />
<img width="300" height="600" alt="image" src="https://github.com/user-attachments/assets/83d12a40-ab59-44be-8559-8e60f0777292" />
<img width="300" height="600" alt="image" src="https://github.com/user-attachments/assets/c88914ab-494d-4f9f-8db7-b770d0213085" />

✨ Key Features
- Precise Input: Dual input fields for Height (Feet and Inches) and a dedicated field for Weight (kg).
- Dynamic Backgrounds: The application UI changes color in real-time based on the BMI result:
    - 🔵 Blue: Underweight
    - 🟢 Green: Healthy / Normal
    - 🟡 Yellow/Orange: Overweight
    - 🔴 Red: Obese
- Instant Calculation: Get your BMI score and health category with a single tap.
- Clear Functionality: Reset all fields and UI states instantly with the "Clear" button.
- Custom Typography: Integrated Lobster Two Google Font for a distinct and modern aesthetic.

🛠️ Tech Stack
- Framework: Flutter
- Language: Dart
- Fonts: Lobster Two

🧮 Logic & Formulas
- The app converts height to total inches and then to meters to apply the standard BMI formula:

  <img width="241" height="89" alt="image" src="https://github.com/user-attachments/assets/8f0b70dc-a229-4c91-a3d2-4435bb644cbf" />

The background color is determined by the following logic:
- BMI < 18.5: Underweight
- 18.5 – 24.9: Healthy
- 25 – 29.9: Overweight
- > 30: Obese

🚀 Installation & Setup
1. Clone the project:
git clone https://github.com/[Your-Username]/Simple-BMI-App.git

2. Add Fonts: Ensure your pubspec.yaml includes the Lobster Two font:
fonts:
  - family: LobsterTwo
    fonts:
      - asset: assets/fonts/LobsterTwo-Regular.ttf

3. Install Packages:
flutter pub get

4. Launch:
flutter run

🕹️ How to Use
1. Enter your height in Feet and Inches.
2. Enter your weight in Kilograms.
3. Tap Calculate to see your BMI and watch the background color shift to reflect your health status.
4. Tap Clear to start over.

Author
- Yash Pale
- Developing simple solutions for a healthier lifestyle.

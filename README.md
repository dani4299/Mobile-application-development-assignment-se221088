# 📱 Flutter Multi-Screen App (Midterm Assignment)

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

A complete, multi-screen Flutter application built to demonstrate core UI components, state management, and form validation. Developed for the Mobile Application Development Midterm at DHA Suffa University (Main Campus).

## ✨ Core Features

* **Secure Authentication Flow:** Fully functional UI for user login and registration.
* **Robust Form Validation:** Real-time error handling for emails, passwords (min. 6 characters, uppercase, special characters), and empty fields using `GlobalKey<FormState>`.
* **Dynamic Navigation:** Seamless routing between screens using `Navigator.push` and `pushReplacement`.
* **Interactive UI Elements:** Implementation of `TextFormField`, dropdown menus for gender selection, and toggleable checkboxes (Remember Me).
* **State Management:** Efficient use of `StatefulWidget` and `setState()` for dynamic UI updates (e.g., toggling password visibility).
* **Scrollable Dashboards:** Utilization of `ListView.builder` to dynamically render user subjects without overflow errors.

## 🏗️ Architecture & Structure

The project follows a clean, simplified architectural pattern to separate business logic from the user interface:
* **Model:** Data blueprints for user entities.
* **Controller:** Logic handling for authentication (`AuthController`).
* **Utils:** Reusable validation logic and helper functions.

## 🚀 How to Run Locally

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/dani4299/Mobile-application-development-assignment-se221088.git](https://github.com/dani4299/Mobile-application-development-assignment-se221088.git)

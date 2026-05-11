// CONTROLLER: Handles the logic for logging in
class AuthController {
  
  // A simple function that returns true if login is successful
  bool verifyLogin(String email, String password) {
    // Fake authentication: just checking if they aren't blank
    if (email.isNotEmpty && password.isNotEmpty) {
      return true; // Login success
    } else {
      return false; // Login fail
    }
  }
}
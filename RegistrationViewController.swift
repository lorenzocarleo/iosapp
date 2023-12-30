// RegistrationViewController.swift
class RegistrationViewController: UIViewController {
    // ...

    @objc func registerButtonTapped() {
        let username = registrationView.usernameTextField.text ?? ""
        let password = registrationView.passwordTextField.text ?? ""
        userModel = UserModel(username: username, password: password)

        NetworkService.registerUser(userModel: userModel!) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    // Handle success, e.g., navigate to the next screen
                case .failure(let error):
                    self?.showErrorAlert(message: "Registration failed: \(error.localizedDescription)")
                }
            }
        }
    }

    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

// UserModel.swift
struct UserModel {
    var username: String
    var securePasswordHash: String

    init(username: String, password: String) {
        self.username = username
        // In a real application, use a secure method to hash the password
        self.securePasswordHash = password // Placeholder for hashed password
    }
}

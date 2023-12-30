// UserModel.swift
struct UserModel {
    var username: String
    private let keychainManager = KeychainManager()
    private let walletKeyIdentifier = "userWalletKey"

    init(username: String, walletKey: String) {
        self.username = username
        // Store the wallet key securely in the keychain
        _ = keychainManager.store(key: walletKeyIdentifier, value: walletKey)
    }

    var walletKey: String? {
        // Retrieve the wallet key securely from the keychain
        return keychainManager.retrieve(key: walletKeyIdentifier)
    }
}

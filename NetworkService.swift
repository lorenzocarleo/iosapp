// NetworkService.swift
class NetworkService {
    static func registerUser(userModel: UserModel, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: "https://yourbackend.com/register") else {
            completion(.failure(NetworkError.badURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = ["username": userModel.username, "password": userModel.password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])

        let task = URLSession.shared.dataTask(with: request) { _, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(NetworkError.requestFailed))
                return
            }

            completion(.success(()))
        }
        task.resume()
    }
}

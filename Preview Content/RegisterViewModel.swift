//
//  RegisterViewModel.swift.swift
//  PostgreSQL&Node.JS
//
//  Created by qwerty on 5.10.2024.
//

import Foundation
import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var message: String = ""

    private func createRequest(endpoint: String, body: [String: Any]) -> URLRequest? {
        guard let url = URL(string: "http://localhost:3000/\(endpoint)") else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        return request
    }

    func register() {
        let body: [String: Any] = ["kname": username, "email": email, "password": password]
        guard let request = createRequest(endpoint: "add-user", body: body) else { return }
        sendRequest(request: request)
    }

    func login() {
        let body: [String: Any] = ["email": email, "password": password]
        guard let request = createRequest(endpoint: "login", body: body) else { return }
        sendRequest(request: request)
    }


    private func sendRequest(request: URLRequest) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Hata oluştu: \(error)")
                return
            }
            
            if let data = data, let response = try? JSONSerialization.jsonObject(with: data, options: []) {
                print("Yanıt: \(response)")
            }
        }.resume()
    }
}

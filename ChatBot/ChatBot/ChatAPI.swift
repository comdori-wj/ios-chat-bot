//
//  ChatAPI.swift
//  ChatBot
//
//  Created by 김예준 on 1/3/24.
//

import Foundation

final class ChatAPI {
    private let baseURL = "https://api.openai.com/v1/chat/completions"
    
    func makeRequest(body: Data?) -> URLRequest? {
        guard let apiKey = Bundle.main.apiKey else { return nil }
        guard let url = URL(string: baseURL) else { return nil }
        var request = URLRequest(url: url)

        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = body
        
        return request
    }
}
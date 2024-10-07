//
//  APIRepository.swift
//  RecipesList
//
//  Created by Asaf Weinberg on 10/6/24.
//

import UIKit

//MARK: Networking

struct APIRepository {

    func getRecipes() async throws -> [Recipe] {
        guard let url = generateURL(urlString: DefaultValues().recipesEndpoint) else {
            throw APIError.parsingError
        }

        let welcome : Welcome =  try await performNetworkTask(url: url, httpMethod: .Get)
        return welcome.recipes
    }

    private func performNetworkTask<T: Codable>(url: URL, httpMethod: HttpMethod, body: Data? = nil) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        if let body = body, httpMethod != .Get {
            request.httpBody = body
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        }
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { throw APIError.networkError }
            let codableResponse = try JSONDecoder().decode(T.self, from: data)
            return codableResponse
        } catch let error {
            throw error
        }
    }

    // MARK: - Helper methods

    private func generateURL(urlString: String, queryParams: [String : String]? = nil) -> URL? {
        guard let url = URL(string: urlString) else { return nil }
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        if let queryParams = queryParams {
            urlComponents?.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        return urlComponents?.url
    }
}

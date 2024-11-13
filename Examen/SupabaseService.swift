//
//  SupabaseService.swift
//  Examen
//
//  Created by Fiorella on 13/11/24.
//

import Foundation

class SupabaseService {
    static let shared = SupabaseService()
    
    private func request<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.addValue("Bearer \(APIConstants.apiKey)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "DataError", code: -1, userInfo: nil)))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchGalerias(completion: @escaping (Result<[Galeria], Error>) -> Void) {
        guard let url = URL(string: "\(APIConstants.baseURL)/galerias") else { return }
        request(url: url, completion: completion)
    }
    
    func fetchPinturas(for galleryId: Int, completion: @escaping (Result<[Pintura], Error>) -> Void) {
        guard let url = URL(string: "\(APIConstants.baseURL)/pinturas?id_galeria=eq.\(galleryId)") else { return }
        request(url: url, completion: completion)
    }
}

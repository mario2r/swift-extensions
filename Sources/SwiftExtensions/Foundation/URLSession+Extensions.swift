//
//  URLSession+Extensions.swift
//
//  Created by mario2r on 11/8/21.
//

import Foundation
import Combine

typealias ShortOutput = URLSession.DataTaskPublisher.Output

public extension URLSession {
    
    // MARK: - Combine cache network calls
    func dataTaskPublisher(for url: URL,
                           cachedResponseOnError: Bool) -> AnyPublisher<ShortOutput, Error> {

        return self.dataTaskPublisher(for: url)
            .tryCatch { [weak self] (error) -> AnyPublisher<ShortOutput, Never> in
                // 4
                guard cachedResponseOnError,
                    let urlCache = self?.configuration.urlCache,
                    let cachedResponse = urlCache.cachedResponse(for: URLRequest(url: url))
                else {
                    throw error
                }
                return Just(ShortOutput(
                    data: cachedResponse.data,
                    response: cachedResponse.response
                )).eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
    
}

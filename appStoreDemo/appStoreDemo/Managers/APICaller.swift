//
//  APICaller.swift
//  appStoreDemo
//
//  Created by thunder on 28/03/21.
//

import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    
    struct  Constants {
        static let baseAPIURL = "https://itunes.apple.com"
        static let rssBaseAPIURL = "https://rss.itunes.apple.com"
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    enum HTTPMethod: String {
        case GET
        case PUT
        case POST
        case DELETE
    }
    
    // MARK: Private
    private init() {}
    
    private func createRequest(with url: URL?,
                               type: HTTPMethod,
                               completion: @escaping (URLRequest) -> Void
    ) {
        guard let apiURL = url else {
            return
        }
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = type.rawValue
        request.timeoutInterval = 30
        completion(request)
    }
    
    // MARK Search iTunes tern
    
    public func searchApps(withParamater paramater: String,
                           type: HTTPMethod,
                           completion: @escaping(Result<SearchResultResponse, Error>) -> Void
    ) {//"?entity=software&term=instagram"
        createRequest(with: URL(string: Constants.baseAPIURL + "/search?entity=software" + paramater), type: .GET) { (request) in
            let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                
                do{
                    //                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    //                    print(json)
                    let result = try JSONDecoder().decode(SearchResultResponse.self, from: data)
                    completion(.success(result))
                }
                catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func fetchGames(completion: @escaping(Result<AppGroup, Error>) -> Void) {
        
        let urlString: String = Constants.rssBaseAPIURL + "/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
        
        createRequest(with: URL(string: urlString), type: .GET) { (request) in
            let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                
                do {
                    // let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    // print(json)
                    
                    let appGroup = try JSONDecoder().decode(AppGroup.self, from: data)
                    completion(.success(appGroup))
                }
                catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
                
            }
            task.resume()
        }
        
    }
}

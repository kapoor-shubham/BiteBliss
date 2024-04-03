//
//  EndPoint.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 28/03/24.
//  Copyright © 2019 Shubham Kapoor. All rights reserved.
//
import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public struct Endpoint {
    var path: APIURLEndpoints
    var httpMethod: HTTPMethod?
    var headers: HTTPHeaders?
    var body: Data?
    var queryItems: [URLQueryItem]?
    
    init(path: APIURLEndpoints, httpMethod:HTTPMethod?, headers: HTTPHeaders? = nil, body: Data? = nil, qeryItems: [URLQueryItem]? = nil ) {
        self.path = path
        self.httpMethod = httpMethod
        self.headers = headers
        self.body = body
        self.queryItems = qeryItems
    }
}

extension Endpoint {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return BaseURLs.prodBaseURL
        case .qa: return BaseURLs.qaBaseURL
        case .staging: return BaseURLs.stagBaseURL
        }
    }
    
    var urlComponents: URLComponents {
        var component = URLComponents(string: environmentBaseURL)!
        component.path = component.path.appending(path.rawValue)
        component.queryItems = queryItems
        return component
    }
    
    var request: URLRequest {
        guard let url = urlComponents.url else { fatalError("baseURL could not be configured.")}
        var request = URLRequest(url: url)
        request.httpMethod  = httpMethod?.rawValue
        request.httpBody    = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if  let headers = headers {
            for(headerField, headerValue) in headers {
                request.setValue(headerValue, forHTTPHeaderField: headerField)
            }
        }
        request.httpShouldHandleCookies = true
        return request
    }
}

extension Endpoint {
    struct BaseURLs {
        static let prodBaseURL = "https://www.themealdb.com/api/json/v1/1/"
        static let qaBaseURL = "https://www.themealdb.com/api/json/v1/1/"
        static let stagBaseURL = "https://www.themealdb.com/api/json/v1/1/"
    }
    
    enum APIURLEndpoints: String {
        case categories = "categories.php"
        case search = "search.php"
    }
}

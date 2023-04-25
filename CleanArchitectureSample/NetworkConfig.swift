//
//  NetworkConfig.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/25.
//

import Foundation

protocol NetworkConfigurable {
    var baseURL: URL { get }
    var headers: [String: String] { get }
    var queryParameters: [String: String] { get }
}

struct ApiDataNetworkConfig: NetworkConfigurable {
    var baseURL: URL
    var headers: [String : String]
    var queryParameters: [String : String]
    
    init(
        baseURL: URL,
        headers: [String: String],
        queryParameters: [String: String]
    ) {
        self.baseURL = baseURL
        self.headers = headers
        self.queryParameters = queryParameters
    }
}

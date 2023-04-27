//
//  ConnectionError.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/27.
//

import Foundation

protocol ConnectionError: Error {
    var isInternetConnectionError: Bool { get }
}

extension Error {
    var isInternetConnectionError: Bool {
        guard let error = self as? ConnectionError, error.isInternetConnectionError else {
            return false
        }
        return true
    }
}

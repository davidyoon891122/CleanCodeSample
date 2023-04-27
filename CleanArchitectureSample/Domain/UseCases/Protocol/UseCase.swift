//
//  UseCase.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/27.
//

import Foundation

protocol UseCase {
    @discardableResult
    func start() -> Cancellable?
}

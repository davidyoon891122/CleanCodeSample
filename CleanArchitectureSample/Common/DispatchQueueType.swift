//
//  DispatchQueueType.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/27.
//

import Foundation

protocol DispatchQueueType {
    func async(execute work: @escaping () -> Void)
}

extension DispatchQueue: DispatchQueueType {
    func async(execute work: @escaping () -> Void) {
        async(group: nil, execute: work)
    }
}


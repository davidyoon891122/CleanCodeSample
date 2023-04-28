//
//  MoviesQueryListItemViewModel.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/28.
//

import Foundation

class MoviesQueryListItemViewModel {
    let query: String
    
    init(query: String) {
        self.query = query
    }
}

extension MoviesQueryListItemViewModel: Equatable {
    static func == (lhs: MoviesQueryListItemViewModel, rhs: MoviesQueryListItemViewModel) -> Bool {
        return lhs.query == rhs.query
    }
}

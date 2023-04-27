//
//  MoviesQueriesRepository.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/27.
//

import Foundation

protocol MoviesQueriesRepository {
    func fetchRecentsQueries(
        maxCount: Int,
        completion: @escaping (Result<[MovieQuery], Error>) -> Void
    )
    
    func saveRecentQuery(
        query: MovieQuery,
        completion: @escaping (Result<MovieQuery, Error>) -> Void
    )
}

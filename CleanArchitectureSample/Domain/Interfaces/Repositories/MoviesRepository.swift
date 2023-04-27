//
//  MoviesRepository.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/27.
//

import Foundation

protocol MoviesRepository {
    @discardableResult
    func fetchMoviesList(
        query: MovieQuery,
        page: Int,
        cached: @escaping (MoviesPage) -> Void,
        completion: @escaping (Result<MoviesPage, Error>) -> Void
    ) -> Cancellable?
}

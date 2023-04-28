//
//  MoviesQueryListViewModel.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/28.
//

import Foundation

typealias MoviesQueryListViewModelDidSelectAction = (MovieQuery) -> Void

protocol MoviesQueryListViewModelInput {
    func viewWillAppear()
    func didSelect(item: MoviesQueryListItemViewModel)
}

protocol MoviesQueryListViewModelOutput {
    var items: Observable<[MoviesQueryListItemViewModel]> { get }
}

protocol MoviesQueryListViewModel: MoviesQueryListViewModelInput & MoviesQueryListViewModelOutput { }

typealias FetchRecentMovieQueriesUseCaseFactory = (
    FetchRecentMovieQueriesUseCase.RequestValue,
    @escaping (FetchRecentMovieQueriesUseCase.ResultValue) -> Void
) -> UseCase


final class DefaultMoviesQueryListViewModel: MoviesQueryListViewModel {
    private let numberOfQueriesToShow: Int
    private let fetchRecentMovieQueriesUseCaseFactory: FetchRecentMovieQueriesUseCaseFactory
    private let didSelect: MoviesQueryListViewModelDidSelectAction?
    private let mainQueue: DispatchQueueType
    
    // MARK: - OUTPUT
    var items: Observable<[MoviesQueryListItemViewModel]> = Observable([])
    
    init(
        numberOfQueriesToShow: Int,
        fetchRecentMovieQueriesUseCaseFactory: @escaping FetchRecentMovieQueriesUseCaseFactory,
        didSelect: MoviesQueryListViewModelDidSelectAction? = nil,
        mainQueue: DispatchQueueType = DispatchQueue.main
    ) {
        self.numberOfQueriesToShow = numberOfQueriesToShow
        self.fetchRecentMovieQueriesUseCaseFactory = fetchRecentMovieQueriesUseCaseFactory
        self.didSelect = didSelect
        self.mainQueue = mainQueue
    }
}

extension DefaultMoviesQueryListViewModel {
    func viewWillAppear() {
        updateMoviesQueries()
    }
    
    func didSelect(item: MoviesQueryListItemViewModel) {
        didSelect?(MovieQuery(query: item.query))
    }
}

private extension DefaultMoviesQueryListViewModel {
    func updateMoviesQueries() {
        let request = FetchRecentMovieQueriesUseCase.RequestValue(maxCount: numberOfQueriesToShow)
        let completion: (FetchRecentMovieQueriesUseCase.ResultValue) -> Void = { [weak self] result in
            guard let self = self else { return }
            self.mainQueue.async {
                switch result {
                case .success(let items):
                    self.items.value = items
                        .map { $0.query }
                        .map(MoviesQueryListItemViewModel.init)
                case .failure:
                    break
                }
            }
        }
        let useCase = fetchRecentMovieQueriesUseCaseFactory(request, completion)
        useCase.start()
    }
}

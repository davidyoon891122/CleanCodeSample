//
//  MoviesSearchFlowCoordinator.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/27.
//

import UIKit

protocol MoviesSearchFlowCoordinatorDependencies {
    func makeMoviesListViewController(
        actions: MoviesListViewModelActions
    ) -> MoviesListViewController
    
    func makeMoviesDetailsViewController(movie: Movie) -> UIViewController
    
//    func makeMoviesQueriesSuggestionsListViewController(
//        didSelect: @escaping MoviesQueriesList
//    )
}

final class MoviesSearchFlowCoordinator {
    private weak var navigationController: UINavigationController?
    private let dependencies: MoviesSearchFlowCoordinatorDependencies
    
    private weak var moviesListVC: MoviesListViewController?
    private weak var moviesQueriesSuggestionsVC: UIViewController?
    
    init(navigationController: UINavigationController,
         dependencies: MoviesSearchFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
//        let actions = MoviesListViewModelActions(
//            showMovieDetails: <#T##(Movie) -> Void#>,
//            showMovieQueriesSuggestions: <#T##(@escaping (MovieQuery) -> Void) -> Void##(@escaping (MovieQuery) -> Void) -> Void##(@escaping (_ didSelect: MovieQuery) -> Void) -> Void#>,
//            closeMovieQueriesSuggestions: <#T##() -> Void#>
//        )
    }
}

private extension MoviesSearchFlowCoordinator {
    func showMovieDetails(movie: Movie) {
//        let vc = dependencies
    }
}

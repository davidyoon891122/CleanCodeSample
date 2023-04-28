//
//  MoviesListViewController.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/27.
//

import UIKit
import SnapKit

final class MoviesListViewController: UIViewController, Alertable {
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = viewModel.searchBarPlaceholder
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.barStyle = .black
        searchController.hidesNavigationBarDuringPresentation = false
//        searchController.searchBar.frame = searchBarContainer.bounds
//        searchBarContainer.addSubview(searchController.searchBar)
        definesPresentationContext = true
        
        if #available(iOS 13.0, *) {
            searchController.searchBar.searchTextField.accessibilityIdentifier = AccessibilityIdentifier.searchField
        }
        
        return searchController
    }()
    
    private lazy var searchBarContainer: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private var viewModel: MoviesListViewModel!
    private var posterImagesRepository: PosterImagesRepository?
    
    // MAKR: - Lifecycle
    
    static func create(
        with viewModel: MoviesListViewModel,
        posterImagesRepository: PosterImagesRepository?
    ) -> MoviesListViewController {
        let view = MoviesListViewController()
        view.viewModel = viewModel
        view.posterImagesRepository = posterImagesRepository
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension MoviesListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        searchController.isActive = false
        viewModel.didSearch(query: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.didCancelSearch()
    }
}

extension MoviesListViewController: UISearchControllerDelegate {
    func willPresentSearchController(_ searchController: UISearchController) {
        updateQueriesSuggestions()
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        updateQueriesSuggestions()
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        updateQueriesSuggestions()
    }
}


private extension MoviesListViewController {
    func setupViews() {
        title = viewModel.screenTitle
        [
            searchBarContainer
        ]
            .forEach {
                view.addSubview($0)
            }
        
        searchBarContainer.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(56.0)
        }
    }
    
    func updateQueriesSuggestions() {
        guard searchController.searchBar.isFirstResponder else {
            viewModel.closeQueriesSuggestions()
            return
        }
        viewModel.showQueriesSuggestions()
    }
}

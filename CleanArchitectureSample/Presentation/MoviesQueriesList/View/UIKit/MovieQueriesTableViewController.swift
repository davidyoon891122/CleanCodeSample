//
//  MovieQueriesTableViewController.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/28.
//

import UIKit
import SnapKit

final class MoviesQueriesTableViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 50.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(
            MoviesQueriesItemCell.self,
            forCellReuseIdentifier: MoviesQueriesItemCell.reuseIdentifier
        )

        return tableView
    }()
    
    // MARK: - Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension MoviesQueriesTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension MoviesQueriesTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}

private extension MoviesQueriesTableViewController {
    func setupViews() {
        
    }
}

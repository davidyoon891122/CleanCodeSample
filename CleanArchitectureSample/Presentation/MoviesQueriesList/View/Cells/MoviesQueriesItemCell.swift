//
//  MoviesQueriesItemCell.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/28.
//

import UIKit
import SnapKit

final class MoviesQueriesItemCell: UITableViewCell {
    static let height = CGFloat(50)
    static let reuseIdentifier = String(describing: MoviesQueriesItemCell.self)
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Suggestion"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: nil)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MoviesQueriesItemCell {
    func setupViews() {
        [
            titleLabel
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(2)
            $0.leading.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().offset(-4)
            $0.bottom.equalToSuperview().offset(-2)
        }
    }
}

//
//  MovieDetailsViewController.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/28.
//

import UIKit

final class MovieDetailsViewController: UIViewController {
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var overviewTextView: UITextView = {
        let textView = UITextView()
        
        return textView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        [
            posterImageView,
            overviewTextView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        posterImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.greaterThanOrEqualTo(200)
        }
        
        overviewTextView.snp.makeConstraints {
            $0.top.equalTo(posterImageView)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension MovieDetailsViewController {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

//
//  PosterImagesRepository.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/27.
//

import Foundation

protocol PosterImagesRepository {
    func fetchImage(
        with imagePath: String,
        width: Int,
        completion: @escaping (Result<Data, Error>) -> Void
    ) -> Cancellable?
}

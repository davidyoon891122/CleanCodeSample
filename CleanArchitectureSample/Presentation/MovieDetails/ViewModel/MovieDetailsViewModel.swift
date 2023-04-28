//
//  MovieDetailsViewModel.swift
//  CleanArchitectureSample
//
//  Created by jiwon Yoon on 2023/04/28.
//

import Foundation

protocol MovieDetailsViewModelInput {
    func updatePosterImage(width: Int)
}

protocol MovieDetailsViewModelOutput {
    var title: String { get }
    var posterImage: Observable<Data?> { get }
    var isPosterImageHidden: Bool { get }
    var overview: String { get }
}

protocol MovieDetailsViewModel: MovieDetailsViewModelInput, MovieDetailsViewModelOutput { }

final class DefaultMovieDetailsViewModel: MovieDetailsViewModel {
    private let posterImagePath: String?
    private let posterImagesRepository: PosterImagesRepository
    private var imageLoadTasK: Cancellable? { willSet { imageLoadTasK?.cancel() } }
    private let mainQueue: DispatchQueueType
    
    // MARK: - OUTPUT
    var title: String
    var posterImage: Observable<Data?> = Observable(nil)
    var isPosterImageHidden: Bool
    var overview: String
    
    init(
        movie: Movie,
        posterImagesRepository: PosterImagesRepository,
        mainQueue: DispatchQueueType = DispatchQueue.main
    ) {
        self.title = movie.title ?? ""
        self.overview = movie.overview ?? ""
        self.posterImagePath = movie.posterPath
        self.isPosterImageHidden = movie.posterPath == nil
        self.posterImagesRepository = posterImagesRepository
        self.mainQueue = mainQueue
    }
}

// MARK: - INPUT. View event methods
extension DefaultMovieDetailsViewModel {
    func updatePosterImage(width: Int) {
        guard let posterImagePath = posterImagePath else { return }
        
        imageLoadTasK = posterImagesRepository.fetchImage(
            with: posterImagePath,
            width: width
        ) { [weak self] result in
            guard let self = self else { return }
            self.mainQueue.async {
                guard self.posterImagePath == posterImagePath else { return }
                switch result {
                case .success(let data):
                    self.posterImage.value = data
                case .failure:
                    break
                }
                self.imageLoadTasK = nil
            }
        }
    }
}

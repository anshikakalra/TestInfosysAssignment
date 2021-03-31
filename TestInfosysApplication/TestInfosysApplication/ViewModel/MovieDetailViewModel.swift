//
//  MovieDetailViewModel.swift
//  MovieDB
//
//  Created by Anshika on 31/03/21.
//  Copyright © 2021 Anshika. All rights reserved.
//

import Foundation

class MovieDetailViewModel {
    
    //MARK: Variables
    var viewModelDetails: Array<String?> = []
    var title: String?
    var releaseDate: String?
    var rating: String?
    
    //MARK: Initializers
    init(movieModel: FactModel?) {
        viewModelDetails.append(movieModel?.title ?? "")
        viewModelDetails.append(movieModel?.releaseDate ?? "")
        if let movieRating = movieModel?.rating {
            self.rating = "\(movieRating)"
        } else {
            self.rating = "No rating"
        }
        viewModelDetails.append(self.rating)
        viewModelDetails.append(movieModel?.imageHref ?? "")
    }
    
}


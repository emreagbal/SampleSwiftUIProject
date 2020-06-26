//
//  movieModel.swift
//  SampleProject
//
//  Created by Emre Ağbal on 17.12.2019.
//  Copyright © 2019 Emre Ağbal. All rights reserved.
//
struct movieDataType: Identifiable, Decodable {
    var id : Int?
    var movieTitle    : String?
    var movieSummary : String?
    var movieImage   : String?
    var movieYear    : String?
    var movieGenre   : String?
    var isPopular    : Bool?
    var isRecommended: Bool?
    
    init(result: [String : AnyObject]?) {
        self.id = result?["id"] as? Int
        self.movieTitle = result?["name"] as? String
        self.movieSummary = result?["summary"] as? String
        let image = result?["image"] as? [String:String]
        self.movieImage = image?["original"]
        self.movieYear = result?["premiered"] as? String 
        let movieGenres = result?["genres"] as? [String]
        if (movieGenres?.isEmpty == false){
            self.movieGenre = movieGenres![0]
        }else {
            self.movieGenre = "comedy"
        }
        self.isPopular = .random()
        self.isRecommended = true
    }
}

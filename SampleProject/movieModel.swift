//
//  movieModel.swift
//  SampleProject
//
//  Created by Emre Ağbal on 17.12.2019.
//  Copyright © 2019 Emre Ağbal. All rights reserved.
//
struct movieDataType: Identifiable, Decodable {
    var id : Int
    var movieTitle   : String
    var movieImage   : String
    var movieYear    : Int
    var movieGenre   : String
    var isPopular    : Bool
    var isRecommended: Bool
}

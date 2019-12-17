//
//  discoverModel.swift
//  SampleProject
//
//  Created by Emre Ağbal on 17.12.2019.
//  Copyright © 2019 Emre Ağbal. All rights reserved.
//
struct discoverDataType: Identifiable, Decodable {
    var id: Int
    var userFullName: String
    var userImageUrl: String
    var createdAt   : String
    var likeCount   : Int
    var commentCount: Int
    var postImage   : String
    var postMessage : String    
}

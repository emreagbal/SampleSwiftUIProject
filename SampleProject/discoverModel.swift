//
//  discoverModel.swift
//  SampleProject
//
//  Created by Emre Ağbal on 17.12.2019.
//  Copyright © 2019 Emre Ağbal. All rights reserved.
//
struct discoverDataType: Identifiable, Decodable {
    var albumId: Int
    var id:      Int
    var title:        String
    var url:          String
    var thumbnailUrl: String
}


//
//  MovieModel.swift
//  movieTaskApp
//
//  Created by Donia Ashraf on 17/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation

struct Response:Codable {
    let results:[Movie]?
}
struct Movie:Codable{
    let id:Int
    let title:String?
    let video:Bool?
    let overview:String?
    let backdrop:String?
    let posterImage:String?
    let releaseDate:String?
    let voteAverage:Double?
    
    enum CodingKeys: String ,CodingKey{
        case id = "id"
        case title = "title"
        case video = "video"
        case overview = "overview"
        case backdrop = "backdrop_path"
        case posterImage = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        
    }
    
}


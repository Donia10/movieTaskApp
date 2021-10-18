//
//  VideoModel.swift
//  movieTaskApp
//
//  Created by Donia Ashraf on 18/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation

struct Video:Codable {
    
    let id:Int
    let key:String
    let name:String
    
}
struct VideosResponse:Codable {
    let id:Int
    let results:[Video]
}

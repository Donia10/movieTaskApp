//
//  URLs.swift
//  movieTaskApp
//
//  Created by Donia Ashraf on 17/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation
struct Urls {
    private static let BaseUrl = "https://api.themoviedb.org/3/"
    static let BaseImgUrl = "https://image.tmdb.org/t/p/w342"
    static func getMovieUrl(query:String) -> String {
        return BaseUrl + "search/movie?api_key=32bdbd740a2356800eff3503e0f1217f?query=\(query)"
      //  return BaseUrl
    }
    static func getVideoUrl(id:Int) ->String {
        return BaseUrl + "movie?\(id)/videos?api_key=32bdbd740a2356800eff3503e0f1217f"
    }
}

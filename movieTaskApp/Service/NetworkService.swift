//
//  NetworkService.swift
//  movieTaskApp
//
//  Created by Donia Ashraf on 17/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func getMovies(query:String,completion: @escaping ([Movie]? , Error?) -> ())
    func getVideos(id:Int,completion: @escaping ([Video]? , Error?) -> ())
    
}
class NetworkService :NetworkServiceProtocol{
    func getVideos(id: Int, completion: @escaping ([Video]?, Error?) -> ()) {
        AF.request(Urls.getVideoUrl(id: id)).validate().responseDecodable(of: VideosResponse.self) {
            (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return }
                completion(data.results , nil)
                
            case .failure(let error):
                print(error)
                completion(nil,error)
            }
        }
        
    }
    
    
    func getMovies(query:String,completion: @escaping ([Movie]?, Error?) -> ()) {
        AF.request(Urls.getMovieUrl(query:query)).validate().responseDecodable(of: Response.self) {
            (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return }
                completion(data.results , nil)
                
            case .failure(let error):
                print(error)
                completion(nil,error)
            }
        }
        
    }
}


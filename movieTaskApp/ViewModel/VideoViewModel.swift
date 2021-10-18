//
//  VideoViewModel.swift
//  movieTaskApp
//
//  Created by Donia Ashraf on 18/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation

class VideoViewModel{
    private let networkService:NetworkServiceProtocol
    var bindToView:()->() = {}
    var bindErrorToView:()->() = {}
    
    init(networkService:NetworkServiceProtocol = NetworkService()) {
        self.networkService = NetworkService()
    }
    
    var key:String?{
        didSet {
            bindToView()
        }
    }
   
    
    var error:String?{
        didSet{
            bindErrorToView()
        }
    }
    private func getVideo(id:Int){
        networkService.getVideos(id: id){
            [weak self](videos,error) in
            
            if let error = error{
                let message = error.localizedDescription
                self?.error = message
            }
            else{
                if let videos = videos {
                    self?.key = videos[0].key
                    return
                }
            }
        }
        
    }
}

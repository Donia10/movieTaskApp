//
//  ViewModel.swift
//  movieTaskApp
//
//  Created by Donia Ashraf on 18/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation

class ViewModel {
    private let networkService:NetworkServiceProtocol
      var bindToView:()->() = {}
      var bindErrorToView:()->() = {}
      
      init(networkService:NetworkServiceProtocol = NetworkService()) {
          self.networkService = NetworkService()
          
      }
      
      var movies:[Movie]?{
          didSet{
              bindToView()
          }
      }
      var error:String?{
          didSet{
              bindErrorToView()
          }
      }
    private func getMovies(query:String){
        networkService.getMovies(query:query){
              [weak self](movies,error) in
              
              if let error = error{
                  let message = error.localizedDescription
                  self?.error = message
              }
              else{
                  if let movies = movies {
                      self?.movies = movies
                  }
              }
          }
          
      }
      func search(searchText:String){
          getMovies(query: searchText)
      }
      
    
}

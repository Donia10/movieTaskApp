//
//  MovieViewModel.swift
//  movieTaskApp
//
//  Created by Donia Ashraf on 17/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
protocol MovieViewModelProtocol {
    //driver
    var dataObservable:Driver<[Movie]>{get}
    func getMovies(query:String)
    func search(searchText:String)
}
class MovieViewModel:MovieViewModelProtocol{
    var dataObservable: Driver<[Movie]>
      private var dataSubject = PublishSubject<[Movie]>()
       var movies :[Movie]?
       var networkservice :NetworkServiceProtocol!
    
    init() {
          dataObservable = dataSubject.asDriver(onErrorJustReturn: movies ?? [])
          self.networkservice = NetworkService()
      //  self.getMovies()
          
      }
    
    func getMovies(query:String) {
        networkservice.getMovies(query: query,completion: { (movies, error) in
                  
                  if let error : Error = error{
                      let message = error.localizedDescription
          //            self.showError = message
                      
                  }else{
                      
                      self.movies = movies
                      //donot force
                      self.dataSubject.onNext(self.movies!)
                      
                  }
                 
              })
    }
    
   
    func search(searchText:String){
        getMovies(query: searchText)
    }
    
}

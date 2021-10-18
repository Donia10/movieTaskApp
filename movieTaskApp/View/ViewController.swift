//
//  ViewController.swift
//  movieTaskApp
//
//  Created by Donia Ashraf on 17/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var moviesTableView: UITableView!
    
    @IBOutlet weak var posterImgView: UIImageView!
    
    @IBOutlet weak var titleTxtView: UILabel!
    @IBOutlet weak var overviewTxtView: UITextView!
    
    @IBOutlet weak var releaseDateTxtView: UILabel!
    @IBOutlet weak var totalAvegTxtView: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var moviesViewModel:MovieViewModelProtocol?
    var viewModel:ViewModel?
    var movies=[Movie]()
       var orginalMovies=[Movie]()


    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    //  moviesViewModel = moviesViewModel()

        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        searchBar.delegate = self

        movies = [Movie]()
        orginalMovies = [Movie]()
        viewModel = ViewModel()
        viewModel?.bindToView = { [weak self] in
            print("vlmf")
            guard let movies = self?.viewModel?.movies else{ return }
            self?.orginalMovies = movies
            self?.movies = movies
            self?.moviesTableView.reloadData()
        }
    
// /** Api Call using RxSwift

//        moviesViewModel = MovieViewModel()
//        moviesViewModel?.dataObservable.drive(moviesTableView.rx.items(cellIdentifier: "movieCell")){row,element,cell in
//           (cell as? MovieTableViewCell)?.titleTxtView.text = element.title
//            (cell as? MovieTableViewCell)?.releaseDateTxtView.text = element.releaseDate
//            (cell as? MovieTableViewCell)?.voteTxtView.text = "\(element.voteAverage!)"
//            (cell as? MovieTableViewCell)?.overviewTxtView.text = element.overview
//            (cell as? MovieTableViewCell)?.overviewTxtView.text = element.overview ?? "fgmkjkbom"
//
//            if element.posterImage != nil{
//
//                (cell as? MovieTableViewCell)?.posterImgView.sd_setImage(with: URL(string:"https://image.tmdb.org/t/p/w342\(element.posterImage!)"), placeholderImage: UIImage(named: "img"))
//            }
//
//        }.disposed(by:disposeBag )
//        moviesViewModel?.getMovies(query: "Thor")
//        moviesTableView.rx.itemSelected
//            .subscribe(onNext: { indexPath in
//
//                print("index path \(indexPath.row)")
//
//            }).disposed(by: disposeBag)
//
//        moviesTableView.rx.itemSelected.subscribe{
//            (indexPath) in print("\(indexPath.element?.row)")
//        }.disposed(by: disposeBag)
//
//        moviesTableView.rx.modelSelected(Movie.self).subscribe{
//            [weak self] (selectedValue) in
//            print(selectedValue.element?.overview!)
//
//            guard let movieDetails = (self?.storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController")) as? MovieDetailsViewController
//                else {return}
//            movieDetails.movie = selectedValue.element
//            self?.navigationController?.pushViewController(movieDetails, animated: true)
//
//
//        }.disposed(by: disposeBag)
// **/
    }
}
extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel?.getMovies(query: searchText)
        print("search")
     
    }
   
}
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
               cell.layer.masksToBounds = true
               cell.selectionStyle = .none
               cell.movie = movies[indexPath.row]
               return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let details = (storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController")) as? MovieDetailsViewController
            else {return}
        details.movie = movies[indexPath.row]
        navigationController?.pushViewController(details, animated: true)
    }
}

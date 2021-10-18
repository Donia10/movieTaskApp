//
//  MovieDetailsViewController.swift
//  movieTaskApp
//
//  Created by Donia Ashraf on 18/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var vote: UILabel!
    
    @IBOutlet weak var backfropImgView: UIImageView!
    @IBOutlet weak var releaseTxtView: UILabel!
    
    @IBOutlet weak var titleTxtView: UILabel!
    @IBOutlet weak var posterImgView: UIImageView!
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var videoBtn: UIButton!
    
    @IBOutlet weak var overviewTxtView: UITextView!
    
    
    var movie:Movie?
    var videoViewsModel:VideoViewModel?
    var key:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        if movie != nil {
            
            vote.text = "\(movie?.voteAverage ?? 0)"
            if(movie?.backdrop != nil){
            backfropImgView.sd_setImage(with: URL(string:"\(Urls.BaseImgUrl)\(movie?.backdrop! ?? "")"), placeholderImage: UIImage(named: "img"))
             background.sd_setImage(with: URL(string:"\(Urls.BaseImgUrl)\(movie?.backdrop! ?? "")"), placeholderImage: UIImage(named: "img"))
            }
            
            releaseTxtView.text = movie?.releaseDate
            titleTxtView.text = movie?.title
            if(movie?.posterImage != nil){
            posterImgView.sd_setImage(with: URL(string:"\(Urls.BaseImgUrl)\(movie?.posterImage! ?? "")"), placeholderImage: UIImage(named: "img"))
            }
              
            overviewTxtView.text = movie?.overview
            if movie?.video == true {
                videoBtn.isHidden = false
                videoBtn.sd_setImage(with: URL(string:"\(Urls.BaseImgUrl)\(movie?.posterImage! ?? "")"), for: .normal, placeholderImage: UIImage(named: "img"))
                videoViewsModel = VideoViewModel()

            }
        }
        
        videoViewsModel?.bindToView = { [weak self] in
                  guard let key = self?.videoViewsModel?.key else{ return }
                  self?.key = key
              }
    }
    
    @IBAction func navigateToYoutube(_ sender: Any) {
        // call to git key
        let url = URL(string: "youtube://"+key)
            
            let YoutubeQuery =  key
            let escapedYoutubeQuery = YoutubeQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            let appURL = NSURL(string: "youtube://www.youtube.com/results?search_query=\(escapedYoutubeQuery!)")!
            let webURL = NSURL(string: "https://www.youtube.com/results?search_query=\(escapedYoutubeQuery!)")!
            let application = UIApplication.shared

            if application.canOpenURL(appURL as URL) {
                application.open(appURL as URL)
            } else {
                // if Youtube app is not installed, open URL inside Safari
                application.open(webURL as URL)
            }
    }

}

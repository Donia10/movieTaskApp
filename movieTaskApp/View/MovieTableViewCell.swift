//
//  MovieTableViewCell.swift
//  movieTaskApp
//
//  Created by Donia Ashraf on 17/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImgView: UIImageView!
    @IBOutlet weak var titleTxtView: UILabel!
    @IBOutlet weak var releaseDateTxtView: UILabel!
    @IBOutlet weak var overviewTxtView: UITextView!
    @IBOutlet weak var voteTxtView: UILabel!
    
    var movie :Movie? {
                 didSet{
                   titleTxtView.text = movie?.title
                   releaseDateTxtView.text = movie?.releaseDate
                   overviewTxtView.text = movie?.overview
                        voteTxtView.text = "\( movie?.voteAverage! ?? 0)"
                   if(movie?.posterImage != nil){
                   posterImgView.sd_setImage(with: URL(string:"\(Urls.BaseImgUrl)\(movie?.posterImage! ?? "")"), placeholderImage: UIImage(named: "img"))
                   }              }
             }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

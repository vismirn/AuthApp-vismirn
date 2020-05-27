//
//  TrackCell.swift
//  AuthApp
//
//  Created by Viktor Smirnov on 23.05.2020.
//  Copyright © 2020 Виктор Смирнов. All rights reserved.
//

import UIKit
import SDWebImage

class TrackCell: UITableViewCell {
    
 
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var nameTrackLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    
    
    
    
    static let reuseIdentifier = "TrackCell"
    
    
// View DidLoad
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .white
        
    }
    
    func setup(track: Track?) {
        guard let track = track else { return }
        nameTrackLabel.text = track.trackName
        artistNameLabel.text = track.artistName
        albumNameLabel.text = track.collectionName
    
        guard let url = URL(string: track.artworkUrl60 ?? "") else { return }
        trackImageView.sd_setImage(with: url, completed: nil)
        
    }

}

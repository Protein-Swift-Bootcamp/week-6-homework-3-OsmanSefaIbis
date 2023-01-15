//
//  GameCell.swift
//  ThirdHomework
//
//  Created by Sefa İbiş on 15.01.2023.
//

import UIKit

class GameCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}


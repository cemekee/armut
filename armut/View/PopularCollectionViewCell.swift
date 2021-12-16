//
//  PopularCollectionViewCell.swift
//  armut
//
//  Created by Cem Eke on 16.12.2021.
//

import UIKit
import Kingfisher

class PopularCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var popular: AllService!{
        didSet{
            let url = URL(string: popular.imageURL ?? "")
            imageView.kf.setImage(with: url)
            lblTitle.text = popular.name
        }
    }
}

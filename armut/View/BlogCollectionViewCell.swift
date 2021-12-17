//
//  BlogCollectionViewCell.swift
//  armut
//
//  Created by Cem Eke on 16.12.2021.
//

import UIKit

class BlogCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var blog: Post!{
        didSet{
            let url = URL(string: blog.imageURL ?? "")
            imgView.kf.setImage(with: url)
            lblTitle.text = blog.category
            lblDescription.text = blog.title
        }
    }

}

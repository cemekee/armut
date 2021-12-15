//
//  DetailViewController.swift
//  armut
//
//  Created by Cem Eke on 15.12.2021.
//

import Foundation
import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgProsView: UIImageView!
    @IBOutlet weak var imgStarView: UIImageView!
    @IBOutlet weak var imgCompleteView: UIImageView!
    @IBOutlet weak var imgChargeView: UIImageView!
    @IBOutlet weak var imgGuaranteeView: UIImageView!
    
    @IBOutlet weak var lblPros: UILabel!
    
    @IBOutlet weak var lblStar: UIView!
    
    @IBOutlet weak var lblComplete: UILabel!
    
    @IBOutlet weak var lblCharge: UILabel!
    
    @IBOutlet weak var lblGuarantee: UILabel!
    
    @IBOutlet weak var lblHowItWorks: UILabel!
    
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

extension DetailViewController {
    func setupUI(){
        let url = URL(string: viewModel.service.imageURL)
        imgView.kf.setImage(with: url)
    }
}

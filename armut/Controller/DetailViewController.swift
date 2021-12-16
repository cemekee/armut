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
    
    @IBOutlet weak var lblStar: UILabel!
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
        let url = URL(string: viewModel.service?.imageURL ?? "")
        imgView.kf.setImage(with: url)
        imgProsView.image = UIImage(named: "icn-profesyonel-number-orange")
        imgStarView.image = UIImage(named: "icn-star-average")
        imgCompleteView.image = UIImage(named: "icn-job-done-orange")
        imgChargeView.image = UIImage(named: "icn-ucretsiz-kullan-orange")
        imgGuaranteeView.image = UIImage(named: "icn-hizmet-garanti-orange")
        lblPros.text = "\(String(describing: viewModel.service?.proCount)) pros near you"
        lblStar.text = "\(String(describing: viewModel.service?.averageRating)) avarage rating"
        lblComplete.text = "Last month \(String(describing: viewModel.service?.completedJobsOnLastMonth)) cleaning job completed"
        lblCharge.text = "Free of charge"
        lblGuarantee.text = "Service Guaranteed"
    }
}

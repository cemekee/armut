//
//  File.swift
//  armut
//
//  Created by Cem Eke on 18.12.2021.
//

import Foundation
import Kingfisher
import UIKit

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
        lblComplete.numberOfLines = 2
        lblCharge.text = "Free of charge"
        lblGuarantee.text = "Service Guaranteed"
    }
}

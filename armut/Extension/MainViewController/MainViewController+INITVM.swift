//
//  MainViewController+INITVM.swift
//  armut
//
//  Created by Cem Eke on 18.12.2021.
//

import Foundation
import UIKit

extension MainViewController {
    func initVM(){
        viewModel.getAllService()
        viewModel.goToDetail = {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
            vc!.viewModel.service = self.viewModel.service
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        viewModel.updateUI = {
            self.collectionViewPopular.reloadData()
            self.collectionViewBlog.reloadData()
        }
        
        viewModel.errorUI = { [weak self] service in
            let alert = UIAlertController(title: "Error!", message: "Service was not found, please try again later.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { alert in
                self?.viewModel.fetchService(service: service ?? 1)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .default ))
            self?.present(alert, animated: true, completion: nil)
        }
    }
}

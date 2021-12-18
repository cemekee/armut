//
//  MainViewController+COLLECTIONSDATASOURCE.swift
//  armut
//
//  Created by Cem Eke on 18.12.2021.
//

import Foundation
import UIKit

//MARK:- CollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewPopular {
            return viewModel.result?.popular.count ?? 0
        } else {
            return viewModel.result?.posts.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewPopular {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as! PopularCollectionViewCell
            cell.popular = viewModel.result?.popular[indexPath.row]
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlogCollectionViewCell", for: indexPath) as! BlogCollectionViewCell
            cell.blog = viewModel.result?.posts[indexPath.row]
            return cell
        }
    }
    
}

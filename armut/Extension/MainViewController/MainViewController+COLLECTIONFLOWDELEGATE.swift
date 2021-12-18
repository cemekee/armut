//
//  MainViewController+COLLECTIONFLOWDELEGATE.swift
//  armut
//
//  Created by Cem Eke on 18.12.2021.
//

import Foundation
import UIKit
//MARK:- CollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewPopular {
            let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let widthPerItem = collectionView.frame.width / 3 - gridLayout.minimumInteritemSpacing
            let heightPerItem = collectionView.frame.height / 1 - gridLayout.minimumInteritemSpacing
            return CGSize(width:widthPerItem, height:heightPerItem)
        }else{
            let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let widthPerItem = collectionView.frame.width / 2.5 - gridLayout.minimumInteritemSpacing
            let heightPerItem = collectionView.frame.height / 1 - gridLayout.minimumInteritemSpacing
            return CGSize(width:widthPerItem, height:heightPerItem)
        }
    }
}

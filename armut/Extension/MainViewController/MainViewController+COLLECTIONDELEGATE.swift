//
//  MainViewController+COLLECTIONDELEGATE.swift
//  armut
//
//  Created by Cem Eke on 18.12.2021.
//

import Foundation
import UIKit

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewPopular {
            goSelectedServiceDetail(index: viewModel.result?.popular[indexPath.row].id ?? 0)
        } else {
            viewModel.openUrl(urlName: viewModel.result?.posts[indexPath.row].link ?? "")
        }
    }
}

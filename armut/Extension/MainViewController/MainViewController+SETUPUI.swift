//
//  MainViewController+SETUPUI.swift
//  armut
//
//  Created by Cem Eke on 18.12.2021.
//

import Foundation
import Kingfisher
import UIKit

extension MainViewController {
    func setupUI(){
        collectionViewPopular.register(UINib(nibName: "PopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularCollectionViewCell")
        collectionViewBlog.register(UINib(nibName: "BlogCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BlogCollectionViewCell")
        collectionViewPopular.dataSource = self
        collectionViewPopular.delegate = self
        collectionViewBlog.dataSource = self
        collectionViewBlog.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10.0
        collectionViewPopular.setCollectionViewLayout(layout, animated: true)
        collectionViewBlog.setCollectionViewLayout(layout, animated: true)
        
        firstImageView.image = UIImage(named: "header")
        secondImageView.image = UIImage(named: "header2")
        btnAmendment.setImage(UIImage.init(named: "tadilat"), for: UIControl.State.normal)
        btnCleaning.setImage(UIImage.init(named: "temizlik"), for: UIControl.State.normal)
        btnTransport.setImage(UIImage.init(named: "nakliyat"), for: UIControl.State.normal)
        btnRepair.setImage(UIImage.init(named: "tamir"), for: UIControl.State.normal)
        btnLesson.setImage(UIImage.init(named: "ozel_ders"), for: UIControl.State.normal)
        btnHealth.setImage(UIImage.init(named: "saglik"), for: UIControl.State.normal)
        btnWedding.setImage(UIImage.init(named: "dugun"), for: UIControl.State.normal)
        btnOther.setImage(UIImage.init(named: "diger"), for: UIControl.State.normal)
        
        
    }
}

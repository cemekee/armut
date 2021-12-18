//
//  MainViewController.swift
//  armut
//
//  Created by Cem Eke on 14.12.2021.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var btnAmendment: UIButton!
    @IBOutlet weak var btnCleaning: UIButton!
    @IBOutlet weak var btnTransport: UIButton!
    @IBOutlet weak var btnRepair: UIButton!
    @IBOutlet weak var btnLesson: UIButton!
    @IBOutlet weak var btnHealth: UIButton!
    @IBOutlet weak var btnWedding: UIButton!
    @IBOutlet weak var btnOther: UIButton!
    @IBOutlet weak var collectionViewPopular: UICollectionView!
    @IBOutlet weak var collectionViewBlog: UICollectionView!
    
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        initVM()
    }
}

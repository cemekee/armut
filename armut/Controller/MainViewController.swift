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
        
        collectionViewPopular.register(UINib(nibName: "PopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularCollectionViewCell")
        collectionViewPopular.dataSource = self
        collectionViewPopular.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5.0
        collectionViewPopular.setCollectionViewLayout(layout, animated: true)
        
    }
    
    
    
}

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
        }
    }
}
extension MainViewController {
    func setupUI(){
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

extension MainViewController {
    @IBAction func btnAmendmentTapped() {
        viewModel.fetchService(service: 208)
    }
    
    @IBAction func btnCleaningTapped() {
        viewModel.fetchService(service: 191)
    }
    
    @IBAction func btnTransportTapped() {
        viewModel.fetchService(service: 142)
    }
    
    @IBAction func btnRepairTapped() {
        viewModel.fetchService(service: 533)
    }
    
    @IBAction func btnLessonTapped() {
        viewModel.fetchService(service: 608)
    }
    
    @IBAction func btnHealthTapped() {
        viewModel.fetchService(service: 51457)
    }
    
    @IBAction func btnWeddingTapped() {
        viewModel.fetchService(service: 59)
    }
    
    @IBAction func btnOtherTapped() {
        viewModel.fetchService(service: -1)
    }
}

//MARK:- CollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.result?.popular.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as! PopularCollectionViewCell
        cell.popular = viewModel.result?.popular[indexPath.row]
        return cell
    }
    
}

//MARK:- CollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let widthPerItem = collectionView.frame.width / 3 - gridLayout.minimumInteritemSpacing
            let heightPerItem = collectionView.frame.height / 1 - gridLayout.minimumInteritemSpacing
            return CGSize(width:widthPerItem, height:heightPerItem)
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc!.viewModel.service. = self.viewModel.result?.popular[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

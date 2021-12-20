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

//MARK: - Actions
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
    
    func goSelectedServiceDetail(index: Int) {
        viewModel.fetchService(service: index)
    }
}

//MARK: - Init View Model
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

//MARK: - Setup UI
extension MainViewController {
    func setupUI(){
        collectionViewPopular.register(UINib(nibName: "PopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularCollectionViewCell")
        collectionViewBlog.register(UINib(nibName: "BlogCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BlogCollectionViewCell")
        collectionViewPopular.dataSource = self
        collectionViewPopular.delegate = self
        collectionViewPopular.tag = 1
        collectionViewBlog.dataSource = self
        collectionViewBlog.delegate = self
        collectionViewBlog.tag = 2
        
        let layout1 = collectionViewPopular.collectionViewLayout as! UICollectionViewFlowLayout
        layout1.scrollDirection = .horizontal
        layout1.itemSize = CGSize.init(width: collectionViewPopular.frame.size.width / 2.5, height: collectionViewPopular.frame.size.height)
        collectionViewPopular.setCollectionViewLayout(layout1, animated: true)
        
        let layout2 = collectionViewBlog.collectionViewLayout as! UICollectionViewFlowLayout
        layout2.scrollDirection = .horizontal
        layout2.itemSize = CGSize.init(width: collectionViewBlog.frame.size.width / 2.5, height: collectionViewBlog.frame.size.height)
        collectionViewBlog.setCollectionViewLayout(layout2, animated: true)
        
        
        firstImageView.image = UIImage(named: "header")
        secondImageView.image = UIImage(named: "header2")
        secondImageView.layer.masksToBounds = true
        secondImageView.layer.cornerRadius = 20.0
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

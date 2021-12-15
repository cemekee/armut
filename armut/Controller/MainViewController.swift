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

extension MainViewController {
    func initVM(){
        viewModel.goToDetail = {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
            vc!.viewModel.service = self.viewModel.service
            self.navigationController?.pushViewController(vc!, animated: true)
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
}

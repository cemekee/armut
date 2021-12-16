//
//  MainViewModel.swift
//  armut
//
//  Created by Cem Eke on 15.12.2021.
//

import Foundation
import Alamofire

class MainViewModel {
    
    var service : Service?
    var result : Result?
    var goToDetail : ()->() = {}
    var updateUI : ()->() = {}
    
    func fetchService(service: Int) {
        
        NetworkManager.instance.fetch(HTTPMethod.get, url: "\(List.getService)\(service)" , requestModel: nil, model: Service.self ) { [weak self] response in
            switch(response)
            {
            case .success(let model):
                let serviceModel = model as! Service
                print("JSON RESPONSE MODEL : \(String(describing: serviceModel))")
                self?.service = serviceModel
                self?.goToDetail()
            case .failure(_):
                break
            }
        }
    }
    
    func getAllService() {
        
        NetworkManager.instance.fetch(HTTPMethod.get, url: "\(List.getAllService)" , requestModel: nil, model: Result.self ) { [weak self] response in
            switch(response)
            {
            case .success(let model):
                let serviceModel = model as! Result
                print("JSON RESPONSE MODEL : \(String(describing: serviceModel))")
                self?.result = serviceModel
                self?.updateUI()
            case .failure(_):
                break
            }
        }
    }
}


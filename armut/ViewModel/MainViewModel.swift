//
//  MainViewModel.swift
//  armut
//
//  Created by Cem Eke on 15.12.2021.
//

import Foundation
import Alamofire

class MainViewModel {
    
    //var movie = Movie(title: "", year: "", rated: "", released: "", poster: "")
    var service = Service(id: 1, serviceID: 1, name: "", longName: "", imageURL: "", proCount: 1, averageRating: 1, completedJobsOnLastMonth: 1)
    var goToDetail : ()->() = {}
    
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
}


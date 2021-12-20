//
//  MainViewModel+OPENURL.swift
//  armut
//
//  Created by Cem Eke on 18.12.2021.
//

import Foundation
import UIKit
extension MainViewModel {
    func openUrl(urlName:String){
        if let url = URL(string: urlName) {
            UIApplication.shared.open(url)
        }
    }
}

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
    var errorUI : (_ service : Int?)->() = { service in }
}

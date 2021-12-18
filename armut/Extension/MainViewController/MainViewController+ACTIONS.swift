//
//  MainViewController+ACTIONS.swift
//  armut
//
//  Created by Cem Eke on 18.12.2021.
//

import Foundation

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

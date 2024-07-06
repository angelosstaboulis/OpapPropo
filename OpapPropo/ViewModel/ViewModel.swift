//
//  ViewModel.swift
//  OpapPropo
//
//  Created by Angelos Staboulis on 6/7/24.
//

import Foundation
actor ViewModel{
    let apiManager = APIManager()
    func fetchPropoData(endPoint:String) async -> Model{
        return await apiManager.fetchOPAPPropo(endpoint: endPoint)
    }
}

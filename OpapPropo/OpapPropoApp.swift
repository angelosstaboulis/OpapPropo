//
//  OpapPropoApp.swift
//  OpapPropo
//
//  Created by Angelos Staboulis on 6/7/24.
//

import SwiftUI

@main
struct OpapPropoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(propoArray:[],year:"",numberGame:"", viewModel: .init())
        }
    }
}

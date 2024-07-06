//
//  ContentView.swift
//  OpapPropo
//
//  Created by Angelos Staboulis on 6/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var propoArray:[Results]
    @State var year:String
    @State var numberGame:String
    @State var viewModel:ViewModel
    var body: some View {
        NavigationStack{
            ScrollView(.vertical) {
                VStack{
                    Text("Enter Number of Game ex:5").frame(width:360,alignment: .leading)
                    TextField("Enter Number of Game ex:5", text: $numberGame)
                    Text("Enter Year ex:2018").frame(width:360,alignment: .leading)
                    TextField("Enter Year ex:2018",text:$year)
                    HStack{
                        Button {
                            Task{
                                let endPoint = year + numberGame
                                await propoArray.append(contentsOf:viewModel.fetchPropoData(endPoint:endPoint).matchXEvents)
                            }
                        } label: {
                            Text("Fetch Results")
                        }
                        Button {
                            propoArray.removeAll()
                        } label: {
                            Text("Clear Results")
                        }
                    }
                }
                ForEach(propoArray,id:\.self){item in
                    HStack{
                        Text(item.teamHome).padding(5)
                        Text(item.teamAway).padding(5)
                        Text(item.score)
                    }.frame(width:350,alignment: .leading)
                }
             
            }.navigationTitle("Αποτελέσματα ΠΡΟΠΟ")
            .navigationBarTitleDisplayMode(.inline)
            HStack{
                Image(.opap).resizable()
            }.frame(width:300,height:187,alignment: .center)
        }
        .padding()
      
    }
}

#Preview {
    ContentView(propoArray:[],year:"",numberGame:"", viewModel: .init())
}

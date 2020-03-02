//
//  ContentView.swift
//  anistory
//
//  Created by RyoOkamto on 2020/02/18.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center) {
            CircleThumbnailImage()
            
            Text("Name").font(.title)
            HStack {
                VStack {
                    Text("Record")
                    viewModel.profileData.map { Text(String($0.recordsCount)) }
                }
                VStack {
                    Text("Followings")
                    viewModel.profileData.map { Text(String($0.followingsCount)) }
                }
                VStack {
                    Text("Follwers")
                    viewModel.profileData.map { Text(String($0.followersCount)) }
                }
            }
        }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 0, maxHeight: .infinity, alignment: .top)
        .onAppear(perform: viewModel.fetchProfile)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}

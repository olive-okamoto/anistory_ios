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
        ZStack(alignment: .center) {
            // MARK: User Profile
            VStack(alignment: .center) {
                CircleThumbnailImage().padding(.top, 20)
                
                HStack {
                    Text("ユーザー名：").font(.subheadline)
                    Text(viewModel.profileData?.username ?? "---").font(.title)
                }.frame(width: .none, height: 32)
                
                HStack(alignment: .center, spacing: 12) {
                    VStack {
                        Text("Record")
                        Text(String(viewModel.profileData?.recordsCount ?? 0))
                    }
                    VStack {
                        Text("Followings")
                        Text(String(viewModel.profileData?.followingsCount ?? 0))
                    }
                    VStack {
                        Text("Follwers")
                        Text(String(viewModel.profileData?.followersCount ?? 0))
                    }
                }
            }.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .top)
            .onAppear(perform: viewModel.fetchProfile)
            
            // MARK: ActivityIndicator
            VStack {
                ActivityIndicator(isAnimating: $viewModel.isLoading, style: .medium)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}

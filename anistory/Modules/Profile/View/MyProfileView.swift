//
//  ContentView.swift
//  anistory
//
//  Created by RyoOkamto on 2020/02/18.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import SwiftUI

struct MyProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center) {
            CircleThumbnailImage()
            
            Text("Name").font(.title)
            viewModel.profileData.map({ profile in
                HStack {
                    VStack {
                        Text("Record")
                        Text(String(profile.recordsCount))
                    }
                    VStack {
                        Text("Followings")
                        Text(String(profile.followingsCount))
                    }
                    VStack {
                        Text("Follwers")
                        Text(String(profile.followersCount))
                    }
                }
            })
        }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 0, maxHeight: .infinity, alignment: .top)
        .onAppear(perform: viewModel.fetchProfile)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyProfileView()
//    }
//}

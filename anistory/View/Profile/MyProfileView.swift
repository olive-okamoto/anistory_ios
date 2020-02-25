//
//  ContentView.swift
//  anistory
//
//  Created by RyoOkamto on 2020/02/18.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import SwiftUI

struct MyProfileView: View {
    var body: some View {
        VStack(alignment: .center) {
            CircleThumbnailImage()
            
            Text("Name").font(.title)
            HStack {
                Text("Record")
                Text("Followings")
                Text("Follwers")
            }
        }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}

//
//  TabView.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/02.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var viewModel: TabBarViewModel
    
    init(viewModel: TabBarViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        viewModel.tabViewList.map { itemList in
            TabView {
                ForEach(0..<itemList.count, id: \.self) {
                    AnyView(itemList[$0]).tabItem {
                        VStack {
                            Image(systemName: "a")
                            Text("TabA")
                        }
                    }.tag($0)
                }
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewModel: TabBarViewModel())
    }
}

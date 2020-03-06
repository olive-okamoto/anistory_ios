//
//  AnimeListView.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/05.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import SwiftUI

struct AnimeListView: View {
    
    @ObservedObject var viewModel: AnimeListViewModel
    
    init(viewModel: AnimeListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AnimeListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeListView(viewModel: AnimeListViewModel())
    }
}

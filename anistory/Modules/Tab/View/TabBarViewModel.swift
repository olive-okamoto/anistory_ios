//
//  TabBarViewModel.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/02.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation
import SwiftUI

class TabBarViewModel: ObservableObject {
    
    @Published var tabViewList: [AnyView]?
    
    func inject(tabViewList: [AnyView]) {
        self.tabViewList = tabViewList
    }
    
}

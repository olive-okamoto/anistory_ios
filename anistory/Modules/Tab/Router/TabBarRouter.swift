//
//  TabBarRouter.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/02.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation
import SwiftUI

class TabBarRouter {
    
    func associateView() -> AnyView {
        let viewInput = TabBarViewModel()
        let view = TabBarView(viewModel: viewInput)
        let tabViewList: [AnyView] = [ProfileRouter().associatedView()]
        viewInput.inject(tabViewList: tabViewList)
        return AnyView(view)
    }
    
}

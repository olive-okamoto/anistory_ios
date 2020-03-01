//
//  ProfileWireframeInterface.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/01.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation
import RxSwift

protocol ProfileViewToPresenterProtocol: AnyObject {
    func fetchProfile()
}

protocol ProfilePresenterToViewProtocol: AnyObject {
    func setProfile(profile: GetViewerInfoQuery.Data.Viewer)
}

protocol ProfilePresenterToRouterProtocol: AnyObject {
    
}

protocol ProfilePresenterToInteractorProtocol: AnyObject {
    func fetchProfile() -> Observable<GetViewerInfoQuery.Data.Viewer>
}

protocol ProfileInteractorToPresenterProtocol: AnyObject {
}


//
//  ProfileViewModel.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/01.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation
import RxSwift

class ProfileViewModel: ObservableObject {
    
    private var presenter: ProfileViewToPresenterProtocol?
    @Published var profileData: GetViewerInfoQuery.Data.Viewer?
    
    func inject(presenter: ProfileViewToPresenterProtocol) {
        self.presenter = presenter
    }
    
    func fetchProfile() {
        presenter?.fetchProfile()
    }
    
}

// MARK: ProfileViewInput
extension ProfileViewModel: ProfilePresenterToViewProtocol {
    func setProfile(profile: GetViewerInfoQuery.Data.Viewer) {
        profileData = profile
    }
}

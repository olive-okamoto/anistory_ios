//
//  ProfilePresenter.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/01.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation
import RxSwift

class ProfilePresenter: ProfileViewToPresenterProtocol {
    
    var interactor: ProfilePresenterToInteractorProtocol
    var router: ProfilePresenterToRouterProtocol
    
    private let disposeBag = DisposeBag()
    
    init(interactor: ProfilePresenterToInteractorProtocol, router: ProfilePresenterToRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func fetchProfile() {
        interactor.fetchProfile()
            .subscribe(
                onNext: { [weak self] profile in
                    // TODO: Pass data to a view
                }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
        
}

//
//  ViewModel.swift
//  BMSPlayground
//
//  Created by Nemi Shah on 08/02/21.
//

import Foundation

enum ActionTypes: DefaultProviding {
    static func getDefaultValue() -> ActionTypes {
        return .noop
    }
    
    case noop, redClicked, greenClicked, blueClicked
}

class ViewModel: BaseViewModel<ActionTypes> {
    
    deinit {
        self.action.removeAllObservers()
    }
    
    func onRedClicked() {
        self.action.value = .redClicked
    }
    
    func onGreenClicked() {
        self.action.value = .greenClicked
    }
    
    func onBlueClicked() {
        self.action.value = .blueClicked
    }
}

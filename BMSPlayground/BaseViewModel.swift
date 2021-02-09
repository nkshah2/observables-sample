//
//  BaseViewModel.swift
//  BMSPlayground
//
//  Created by Nemi Shah on 08/02/21.
//

import Foundation

class BaseViewModel<ActionType: DefaultProviding> {
    var action: Observable<ActionType>
    
    init() {
        action = Observable<ActionType>(initialValue: ActionType.getDefaultValue())
    }
}

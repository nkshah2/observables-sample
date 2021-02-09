//
//  ViewModelAction.swift
//  BMSPlayground
//
//  Created by Nemi Shah on 08/02/21.
//

import Foundation

class ViewModelAction<ActionType>: NSObject {
    var type: ActionType
    
    init(type: ActionType) {
        self.type = type
    }
}

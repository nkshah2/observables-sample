//
//  Observable.swift
//  BMSPlayground
//
//  Created by Nemi Shah on 08/02/21.
//

import Foundation

class Observable<T> {
    private var observers: [Int: Observer] = [:]
    private var lastUsedId: Int = -1
    
    /// Current value of the observer, notifies all observers when the value of this variable changes
    var value: T {
        didSet {
            observers.forEach { _, observer in
                observer(value, oldValue)
            }
        }
    }
    
    /// Typealias for callbacks that are used to notify changes in value for this observable.
    /// (newValue, oldValue) -> Void
    public typealias Observer = (T, T) -> Void
    
    init(initialValue: T) {
        value = initialValue
    }
    
    
    /// Use this function to add observers for this observable
    /// - Parameter observer: Observer to add
    /// - Returns: Identifier that can be used to remove observers
    @discardableResult func observe(observer: @escaping Observer) -> Int? {
        let id = lastUsedId + 1
        observers[id] = observer
        lastUsedId = id
        return id
    }
    
    func removeObserver(forId id: Int) {
        observers.removeValue(forKey: id)
    }
    
    func removeAllObservers() {
        observers.removeAll()
    }
}

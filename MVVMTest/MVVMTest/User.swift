//
//  User.swift
//  MVVMTest
//
//  Created by Anton Novoselov on 22/03/2018.
//  Copyright © 2018 Anton Novoselov. All rights reserved.
//

import UIKit

struct User {
    var name: Observable<String>
}

class Observable<ObservedType> {
    private var _value: ObservedType?
    
    public var value: ObservedType? {
        get {
            return _value
        }
        
        set {
            _value = newValue
            valueChanged?(_value!)
        }
    }
    
    var valueChanged: ((ObservedType) -> ())?
    
    init(_ value: ObservedType) {
        _value = value
    }
    
    func bindingChanged(to newValue: ObservedType) {
        _value = newValue
        print("value is now \(newValue)")
    }
}

class BoundTextField: UITextField {
    var changeClosure: (() -> ())?
    
    @objc func valueChanged() {
        changeClosure?()
    }
    
    func bind(to observable: Observable<String>) {
        addTarget(self, action: #selector(BoundTextField.valueChanged), for: .editingChanged)
        
        changeClosure = { [weak self] in
            observable.bindingChanged(to: self?.text ?? "")
        }
        
        observable.valueChanged = { [weak self] newValue in
            self?.text = newValue
        }
    }
}

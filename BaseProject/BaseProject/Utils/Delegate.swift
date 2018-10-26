//
//  Delegate.swift
//  BaseProject
//
//  Created by mac on 2018/10/26.
//  Copyright © 2018年 jintelai. All rights reserved.
//

import UIKit

class Delegate<Input, Output> {
    private var block: ((Input) -> Output?)?
    func delegate<T: AnyObject>(on target: T, block: ((T, Input) -> Output)?) {
        self.block = { [weak target] input in
            guard let target = target else { return nil }
            return block?(target, input)
        }
    }
    
    func call(_ input: Input) -> Output? {
        return block?(input)
    }
}

extension Delegate where Input == Void {
    func call() -> Output? {
        return call(())
    }
}

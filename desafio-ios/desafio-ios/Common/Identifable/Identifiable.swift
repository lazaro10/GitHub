//
//  Identifiable.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

public protocol Identifiable: class {
    
    static var identifier: String { get }
    static var bundle: Bundle { get }
    static var nibName: String { get }
}

extension Identifiable where Self: UIView {
    
    public static var identifier: String {
        return String(describing: self)
    }
    
    public static var bundle: Bundle {
        return Bundle(for: self)
    }
    
    public static var nibName: String {
        return identifier
    }
    
}

extension Identifiable where Self: UIViewController {
    
    public static var identifier: String {
        return String(describing: self)
    }
    
    public static var bundle: Bundle {
        return Bundle(for: self)
    }
    
    public static var nibName: String {
        return identifier
    }
}

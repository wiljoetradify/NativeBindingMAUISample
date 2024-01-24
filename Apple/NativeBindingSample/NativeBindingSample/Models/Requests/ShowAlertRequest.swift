//
//  ShowAlertRequest.swift
//  NativeBindingSample
//
//  Created by wilson joe on 23/01/24.
//

import Foundation

@objc
public class ShowAlertRequest: NSObject {
    @objc public var title: String = "";
    @objc public var message: String = "";
    @objc public var buttonCaption: String = "";
}

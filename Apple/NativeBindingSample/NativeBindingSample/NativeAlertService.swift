//
//  TestClass.swift
//  NativeBindingSample
//
//  Created by wilson joe on 23/01/24.
//

import Foundation
import UIKit

@objc 
public class NativeAlertService: NSObject {
    @objc
    public func showAlert(viewController: UIViewController, request: ShowAlertRequest, animated: Bool, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: request.title, message: request.message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: request.buttonCaption, style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alert, animated: animated, completion: completion)
    }
}

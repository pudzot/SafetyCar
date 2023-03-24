//
//  BaseViewController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 23/03/2023.
//

import TPCommon
import UIKit

class BaseViewController<V: UIView>: ViewController, CustomViewType {
 
    typealias View = V
}

class BaseOrientationViewController<Portrait: UIView,
                                    LandscapeLeft: UIView,
                                    LandscapeRight: UIView>: ViewController, CustomOrientationViewType {
 
    typealias PortraitView = Portrait
    typealias LandscapeLeftView = LandscapeLeft
    typealias LandscapeRightView = LandscapeRight
}

class BaseView: View {}

class BaseLabel: Label {}

class BaseContentStateViewController: ContentStateViewController {}

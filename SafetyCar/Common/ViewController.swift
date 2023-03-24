//
//  ViewController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 23/03/2023.
//

import UIKit

open class ViewController: UIViewController {

    var hideKeyboardOnTap: Bool = false {
        didSet {
            if hideKeyboardOnTap {
                subscribeToKeyboardNotifications()
            } else {
                unsubscribeFromKeyboardNotifications()
            }
        }
    }

    private var tapGestureRecognizer: UITapGestureRecognizer?

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        nil
    }

    deinit {
        print("\(type(of: self)) -> \(#function)")
    }
}

private extension ViewController {

    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }

    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }

    @objc
    func keyboardWillShow(_ notification: Notification) {
        addTapGestureRecognizer()
    }

    @objc
    func keyboardWillHide(_ notification: Notification) {
        removeTapGestureRecognizer()
    }
}

private extension ViewController {

    func addTapGestureRecognizer() {
        guard tapGestureRecognizer == nil else {
            return
        }

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onDidTapView))
        view.addGestureRecognizer(tapGestureRecognizer)
        self.tapGestureRecognizer = tapGestureRecognizer
    }

    func removeTapGestureRecognizer() {
        guard let tapGestureRecognizer = tapGestureRecognizer else {
            return
        }

        view.removeGestureRecognizer(tapGestureRecognizer)
        self.tapGestureRecognizer = nil
    }

    @objc
    func onDidTapView() {
        if hideKeyboardOnTap {
            hideKeyboard()
        }
    }
}

extension UIViewController {

    func hideKeyboard() {
        view.endEditing(true)
    }
}


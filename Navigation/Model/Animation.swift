//
//  Animation.swift
//  Navigation
//
//  Created by Igor Guzei on 29.12.2022.
//

import UIKit

func bc(_ field: UITextField) {
    UIView.animate(withDuration: 0.5) {
        field.backgroundColor = UIColor(named: "errorBackground")
    } completion: { _ in
        UIView.animate(withDuration: 0.5, delay: 0.0) {
            field.backgroundColor = .systemGray6
        }
    }
}

//extension UIView {
//    func bcc() {
//        let animator = CASpringAnimation()
//        animator.duration = 1
//        animator.repeatCount = 3
//        let a = animator as? UITextField
//        layer.add(animator, forKey: "bcc")
//    }
//}
//            loginField.bcc()
//            if field == "login" {
//                UIView.animate(withDuration: 0.5) { [self] in
//                    loginField.backgroundColor = UIColor(named: "errorBackground")
//                } completion: { _ in
//                    UIView.animate(withDuration: 0.5, delay: 0.0) { [self] in
//                        loginField.backgroundColor = .systemGray6
//                    }
//                }
//            } else {
//                UIView.animate(withDuration: 0.5) { [self] in
//                    passwordField.backgroundColor = UIColor(named: "errorBackground")
//                } completion: { _ in
//                    UIView.animate(withDuration: 0.5, delay: 0.0) { [self] in
//                        passwordField.backgroundColor = .systemGray6
//                    }
//                }
//            }



extension UIView {

    func shake1() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = 3
        animation.duration = 0.1
        animation.autoreverses = true
        animation.values = [3, -3]
        layer.add(animation, forKey: "shake")
    }

    func shake2() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

public func shake3(view: UIView) {

    let propertyAnimator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.3) {
        view.transform = CGAffineTransform(translationX: 10, y: 0)

    }
    propertyAnimator.addAnimations({view.transform = CGAffineTransform(translationX: 0, y: 0)}, delayFactor: 0.2)
    propertyAnimator.startAnimation()
}

public func shake4(view: UIView) {

    let propertyAnimator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.3) {
        view.transform = CGAffineTransform(translationX: 10, y: 0)
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 1
    }

    propertyAnimator.addAnimations({view.transform = CGAffineTransform(translationX: 0, y: 0)}, delayFactor: 0.2)
    propertyAnimator.addCompletion { (_) in view.layer.borderWidth = 0 }
    propertyAnimator.startAnimation()
}

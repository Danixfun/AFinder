//
//  AnimationWrapper.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//

import Foundation
import UIKit
import Lottie


class AnimationWrapper {
    class func setUpAnimation(in container: UIView, withFile name: String){
        let animationJSONName = name
        let animation = Animation.named(animationJSONName)
        let animationView = AnimationView(animation: animation)
        let animationViewSide:CGFloat = container.bounds.size.width
        
        container.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            animationView.heightAnchor.constraint(equalToConstant: animationViewSide),
            animationView.widthAnchor.constraint(equalToConstant: animationViewSide)
        ])
        animationView.loopMode = .repeat(.infinity)
        animationView.play()
    }
}


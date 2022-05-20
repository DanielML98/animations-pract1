//
//  Loaderview.swift
//  Animations
//
//  Created by Daniel Martínez on 20/05/22.
//

import UIKit
import Lottie

enum AvailableAnimations: String {
  case fish
  case dog
  case wolverine
}

public class LoaderView: UIView {
  
  var selectedAnimation: AvailableAnimations?
  
  init(_ selectedAnimation: AvailableAnimations) {
    self.selectedAnimation = selectedAnimation
    super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    commonInit()
  }
  
  required init? (coder aDecoder: NSCoder) {
    super.init(coder:aDecoder)
    commonInit()
  }
  func commonInit() {
    let animationView = AnimationView(name: selectedAnimation?.rawValue ?? "")
    animationView.frame = CGRect (x: 0, y: 0, width: 400, height: 400)
    animationView.center = self.center
    animationView.animationSpeed = 1.0
    animationView.contentMode = .scaleAspectFill
    self.addSubview(animationView)
    animationView.play()
    animationView.translatesAutoresizingMaskIntoConstraints = false
    animationView.centerXAnchor.constraint(equalTo:centerXAnchor).isActive = true
    animationView.centerYAnchor.constraint(equalTo:centerYAnchor).isActive = true
    animationView.widthAnchor.constraint(equalToConstant:280).isActive = true
    animationView.heightAnchor.constraint(equalToConstant: 108).isActive = true
  }
}

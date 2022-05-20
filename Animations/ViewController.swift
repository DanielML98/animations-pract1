//
//  ViewController.swift
//  Animations
//
//  Created by Daniel Martínez on 20/05/22.
//

import UIKit

class ViewController: UIViewController {
  
  private var segmentedControl: UISegmentedControl {
    let segmentedControl = UISegmentedControl(items: ["Fish", "Dog", "Wolverine"])
    segmentedControl.frame = CGRect(x: 10, y: 40, width:self.view.bounds.width - 20, height: 30)
    segmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
    segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
    return segmentedControl
    
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.addSubview(segmentedControl)
  }

  @objc func segmentChanged(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      changeAnimation(.fish)
    case 1:
      changeAnimation(.dog)
    case 2:
      changeAnimation(.wolverine)
    default:
      changeAnimation(.fish)
    }
  }
  
  private func changeAnimation(_ animation: AvailableAnimations){
    if let loaderView: LoaderView = view.subviews.last as? LoaderView {
      loaderView.removeFromSuperview()
    }
    let animation = LoaderView(animation)
    animation.frame.size = CGSize(width: 400, height: 400)
    animation.center = self.view.center
    view.addSubview(animation)
    view.backgroundColor = .cyan
  }

}


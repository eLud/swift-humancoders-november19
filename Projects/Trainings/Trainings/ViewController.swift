//
//  ViewController.swift
//  Trainings
//
//  Created by Ludovic Ollagnier on 19/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var themeTextField: UITextField!
    @IBOutlet weak var durationStepper: UIStepper!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var trainerNameTextField: UITextField!
    @IBOutlet weak var styleSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        configureSegmentedControl()
    }

    @IBAction func steppedValueChanged(_ sender: UIStepper) {
        durationLabel.text = "\(Int(sender.value))"
    }

    @IBAction func save(_ sender: UIButton) {
    }

    private func configureSegmentedControl() {
        let allStyles = Training.Style.allCases

          styleSegmentedControl.removeAllSegments()
          for style in allStyles {
              styleSegmentedControl.insertSegment(withTitle: style.test(), at: styleSegmentedControl.numberOfSegments, animated: false)
          }
          styleSegmentedControl.selectedSegmentIndex = 0
    }
}


//
//  ViewController.swift
//  Trainings
//
//  Created by Ludovic Ollagnier on 19/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var isFullSwitch: UISwitch!
    @IBOutlet weak var themeTextField: UITextField!
    @IBOutlet weak var durationStepper: UIStepper!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var trainerNameTextField: UITextField!
    @IBOutlet weak var styleSegmentedControl: UISegmentedControl!

    var manager: TrainingManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        configureSegmentedControl()
    }

    @IBAction func steppedValueChanged(_ sender: UIStepper) {
        durationLabel.text = "\(Int(sender.value))"
    }

    @IBAction func save(_ sender: UIButton) {

        guard let theme = themeTextField.text, !theme.isEmpty else { return }
        guard let trainerName = trainerNameTextField.text else { return }
        guard let style = Training.Style(rawValue: styleSegmentedControl.selectedSegmentIndex) else { return }

        let newTraining = Training(theme: theme, duration: Int(durationStepper.value), isFull: isFullSwitch.isOn, trainer: Trainer(firstName: trainerName), style: style)

        manager?.add(newTraining)
        dismiss(animated: true, completion: nil)
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


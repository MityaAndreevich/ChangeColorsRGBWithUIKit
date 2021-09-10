//
//  SettingsViewController.swift
//  ChangeColorsRGBWithUIKit
//
//  Created by Dmitry Logachev on 20.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var viewOfColor: UIView!
    
    @IBOutlet weak var redMeasure: UILabel!
    @IBOutlet weak var greenMeasure: UILabel!
    @IBOutlet weak var blueMeasure: UILabel!
    
    @IBOutlet weak var sliderForRed: UISlider!
    @IBOutlet weak var sliderForGreen: UISlider!
    @IBOutlet weak var sliderForBlue: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    // MARK: - Public Properties
    var startingVCbackgroundColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        viewOfColor.layer.cornerRadius = 15
        
        viewOfColor.backgroundColor = startingVCbackgroundColor
        
        setSliders()
        
        setValue(for: redMeasure, greenMeasure, blueMeasure)
        setValue(for: redTextField, greenTextField, blueTextField)
    }
    
    // MARK: - IB Actions
    @IBAction func changeColorForSliders(_ sender: UISlider) {
        switch sender {
        case sliderForRed:
            redMeasure.text = string(from: sliderForRed)
            redTextField.text = string(from: sliderForRed)
        case sliderForGreen:
            greenMeasure.text = string(from: sliderForGreen)
            greenTextField.text = string(from: sliderForGreen)
        default:
            blueMeasure.text = string(from: sliderForBlue)
            blueTextField.text = string(from: sliderForBlue)
        }
        summarizeSliderValues()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewBackgroundColor(for: viewOfColor.backgroundColor ?? .red)
        dismiss(animated: true)
    }
    
    
    // MARK: - Private Methods
    private func summarizeSliderValues() {
        viewOfColor.backgroundColor = UIColor(
            red: CGFloat(sliderForRed.value),
            green: CGFloat(sliderForGreen.value),
            blue: CGFloat(sliderForBlue.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redMeasure:
                redMeasure.text = string(from: sliderForRed)
            case greenMeasure:
                greenMeasure.text = string(from: sliderForGreen)
            default:
                blueMeasure.text = string(from: sliderForBlue)
            }
        }
    }
    
    private func setValue(for textF: UITextField...) {
        textF.forEach { tField in
            switch tField {
            case redTextField:
                redTextField.text = string(from: sliderForRed)
            case greenTextField:
                greenTextField.text = string(from: sliderForGreen)
            default:
                blueTextField.text = string(from: sliderForBlue)
            }
        }
    }
        
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func float(from textField: UITextField) -> Float {
        Float(textField.text ?? "0") ?? 0
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: startingVCbackgroundColor)
        
        sliderForRed.value = Float(ciColor.red)
        sliderForGreen.value = Float(ciColor.green)
        sliderForBlue.value = Float(ciColor.blue)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//Mark: - Extensions
extension SettingsViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case redTextField:
            sliderForRed.setValue(float(from: redTextField), animated: true)
        case greenTextField:
            sliderForGreen.setValue(float(from: greenTextField), animated: true)
        default:
            sliderForBlue.setValue(float(from: blueTextField), animated: true)
        }
        setValue(for: redMeasure, greenMeasure, blueMeasure)
        summarizeSliderValues()
    }
}


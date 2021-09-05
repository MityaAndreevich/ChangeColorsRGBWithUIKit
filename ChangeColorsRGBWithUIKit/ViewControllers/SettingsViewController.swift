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
    
    // MARK: - Public properties
    var startingVCbackgroundColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - Private properties
    private var red: CGFloat = 0
    private var green: CGFloat = 0
    private var blue: CGFloat = 0
    private var alpha: CGFloat = 1
    
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewOfColor.layer.cornerRadius = 15
        
        viewOfColor.backgroundColor = startingVCbackgroundColor
        
        getRGBComponents()
        
        sliderForRed.value = Float(red)
        sliderForGreen.value = Float(green)
        sliderForBlue.value = Float(blue)
        
        setValue(for: redMeasure, greenMeasure, blueMeasure)
        setValue(for: redTextField, greenTextField, blueTextField)
        summarizeSliderValues()
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
        delegate.setNewBackgroundColor(for: viewOfColor.backgroundColor ?? UIColor.red)
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
    
    //private func summarizeTFvalues() {
      //  viewOfColor.backgroundColor = UIColor(
        //    red: CGFloat(float(from: redTextField)),
          //  green: CGFloat(float(from: greenTextField)),
            //blue: CGFloat(float(from: blueTextField)),
            //alpha: 1)
   // }
    
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
    
    //private func string(from textField: UITextField) -> String {
      //  String(textField.text ?? "0")
    //}
    
    private func float(from textField: UITextField) -> Float {
        Float(textField.text ?? "0") ?? 0
    }
    
    private func getRGBComponents() {
        startingVCbackgroundColor.getRed(&red,
                                         green: &green,
                                         blue: &blue,
                                         alpha: &alpha)
    }
}

//Mark: - Extensions
extension SettingsViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case redTextField:
            //redMeasure.text = string(from: redTextField)
            sliderForRed.setValue(float(from: redTextField), animated: true)
        case greenTextField:
            // greenMeasure.text = string(from: greenTextField)
            sliderForGreen.value = float(from: greenTextField)
        default:
            // blueMeasure.text = string(from: blueTextField)
            sliderForBlue.value = float(from: blueTextField)
        }
        setValue(for: redMeasure, greenMeasure, blueMeasure)
        summarizeSliderValues()
    }
}


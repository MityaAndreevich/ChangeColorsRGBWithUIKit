//
//  ViewController.swift
//  ChangeColorsRGBWithUIKit
//
//  Created by Dmitry Logachev on 20.08.2021.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IB Outlets
    @IBOutlet weak var viewOfColor: UIView!
    
    @IBOutlet weak var redMeasure: UILabel!
    @IBOutlet weak var greenMeasure: UILabel!
    @IBOutlet weak var blueMeasure: UILabel!
    
    @IBOutlet weak var sliderForRed: UISlider!
    @IBOutlet weak var sliderForGreen: UISlider!
    @IBOutlet weak var sliderForBlue: UISlider!
    //MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewOfColor.layer.cornerRadius = 15
        
        sliderForRed.value = 0.5
        sliderForGreen.value = 0.25
        sliderForBlue.value = 0
        
        setValue(for: redMeasure, greenMeasure, blueMeasure)
        summarizeSliderValues()
    }
    //MARK: - IB Actions
    @IBAction func changeColorForSliders(_ sender: UISlider) {
        switch sender {
        case sliderForRed:
            redMeasure.text = string(from: sliderForRed)
        case sliderForGreen:
            greenMeasure.text = string(from: sliderForGreen)
        default:
            blueMeasure.text = string(from: sliderForBlue)
        }
        summarizeSliderValues()
    }
    
    //MARK: - Private Methods
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
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}


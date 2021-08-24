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
        
        redMeasure.text = String(sliderForRed.value)
        greenMeasure.text = String(sliderForGreen.value)
        blueMeasure.text = String(sliderForBlue.value)
        
        summarizeSliderValues()
    }
    //MARK: - IB Actions
    @IBAction func changeColorForRed() {
        redMeasure.text = String(format: "%.2f", sliderForRed.value)
        summarizeSliderValues()
    }
    
    @IBAction func changeColorForGreen() {
        greenMeasure.text = String(format: "%.2f", sliderForGreen.value)
        summarizeSliderValues()
    }
    
    @IBAction func changeColorForBlue() {
        blueMeasure.text = String(format: "%.2f", sliderForBlue.value)
        summarizeSliderValues()
    }
    //MARK: - Private Methods
    private func summarizeSliderValues() {
        let redValue = CGFloat(sliderForRed.value)
        let greenValue = CGFloat(sliderForGreen.value)
        let blueValue = CGFloat(sliderForBlue.value)
        viewOfColor.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
}


//
//  ViewController.swift
//  ChangeColorsRGBWithUIKit
//
//  Created by Дмитрий Логачёв on 20.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewOfColor: UIView!
    
    @IBOutlet weak var redMeasure: UILabel!
    @IBOutlet weak var greenMeasure: UILabel!
    @IBOutlet weak var blueMeasure: UILabel!
    
    @IBOutlet weak var sliderForRed: UISlider!
    @IBOutlet weak var sliderForGreen: UISlider!
    @IBOutlet weak var sliderForBlue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewOfColor.layer.cornerRadius = 10
    }

    @IBAction func changeRedColorSlider() {
        //viewOfColor.backgroundColor = .red(sliderForRed.value)
        redMeasure.text = String(sliderForRed.value)
        let redSliderValue = CGFloat(sliderForRed.value)
        viewOfColor.backgroundColor = UIColor(red: redSliderValue, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func changeColorForGreen() {
        greenMeasure.text = String(sliderForGreen.value)
        let greenMeasureValue = CGFloat(sliderForGreen.value)
        viewOfColor.backgroundColor = UIColor(red: 0, green: greenMeasureValue, blue: 0, alpha: 1)
    }
    
    @IBAction func changeColorForBlue() {
        blueMeasure.text = String(sliderForBlue.value)
    }
    
}


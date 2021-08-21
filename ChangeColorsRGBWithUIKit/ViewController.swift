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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewOfColor.layer.cornerRadius = 10
    }

    @IBAction func changeRedColorSlider() {
        
        //viewOfColor.backgroundColor = .red(sliderForRed.value)
        redMeasure.text = String(sliderForRed.value)
    }
    
}


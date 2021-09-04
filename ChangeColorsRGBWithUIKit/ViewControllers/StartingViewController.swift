//
//  StartingViewController.swift
//  ChangeColorsRGBWithUIKit
//
//  Created by Дмитрий Логачёв on 04.09.2021.
//

import UIKit

class StartingViewController: UIViewController {
    
    //let backgroundColor = UIColor.self

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.startingVCbackgroundColor = self.view.backgroundColor
    }
}

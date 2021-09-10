//
//  StartingViewController.swift
//  ChangeColorsRGBWithUIKit
//
//  Created by Dmitry Logachev on 04.09.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewBackgroundColor(for view: UIColor)
}

class StartingViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.startingVCbackgroundColor = view.backgroundColor
    }
}

extension StartingViewController: SettingsViewControllerDelegate {
    func setNewBackgroundColor(for view: UIColor) {
        self.view.backgroundColor = view   // we have self. here because we also have view as parameter in method
    }
}

//
//  StartingViewController.swift
//  ChangeColorsRGBWithUIKit
//
//  Created by Дмитрий Логачёв on 04.09.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewBackgroundColor(for view: UIColor)
}

class StartingViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.startingVCbackgroundColor = self.view.backgroundColor
        settingsVC.delegate = self
    }
}

extension StartingViewController: SettingsViewControllerDelegate {
    func setNewBackgroundColor(for view: UIColor) {
        self.view.backgroundColor = view
    }
}

//
//  ViewController.swift
//  SlideInMenu
//
//  Created by Landon Tetreault on 2016-12-21.
//  Copyright © 2016 Landon Tetreault. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let openButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open", for: .normal)
        button.addTarget(self, action: #selector(handleMenu), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(openButton)
        openButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        openButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc func handleMenu() {
        if DrawerViewController.instance.isDrawerOpen {
            self.closeDrawer()
        } else {
            self.openDrawer()
        }
    }
    
    func openDrawer() {
        DrawerViewController.instance.openDrawer()
    }
    
    func closeDrawer() {
        DrawerViewController.instance.closeDrawer()
    }
}


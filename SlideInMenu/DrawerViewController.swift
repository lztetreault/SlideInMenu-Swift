//
//  DrawerViewController.swift
//  SlideInMenu
//
//  Created by Landon Tetreault on 2016-12-21.
//  Copyright © 2016 Landon Tetreault. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController {

    var isDrawerOpen = false
    static let instance = DrawerViewController()
    let keyWindow = UIApplication.shared.keyWindow
    let viewWidth = ((UIApplication.shared.keyWindow?.frame.width)!/3) * 2
    
    let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Landon"
        label.textAlignment = .center
        return label
    }()
    
    
    fileprivate init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.frame = CGRect(x: -viewWidth, y: 0, width: viewWidth, height: view.frame.height)
        view.backgroundColor = UIColor.gray
        view.addSubview(name)
        
        name.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        name.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        name.widthAnchor.constraint(equalToConstant: 200).isActive = true
        keyWindow?.addSubview(self.view)
    }
    
    func openDrawer() {
        print(self.view.frame.width)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.frame.origin.x = 0
        }) { (success) in
            self.isDrawerOpen = true
        }
    }
    
    func closeDrawer() {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.frame.origin.x = -self.viewWidth
        }) { (success) in
            self.isDrawerOpen = false
        }
    }
}

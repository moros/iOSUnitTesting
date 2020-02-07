//
//  MainCoordinator.swift
//  iOSUnitTesting
//
//  Created by dmason on 2/7/20.
//

import Foundation
import UIKit

class MainCoordinator
{
    var navigationController = UINavigationController()
    
    func start()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateInitialViewController() as? ViewController else {
            fatalError("Missing initial view controller in Main.storyboard.")
        }
        
        controller.picturesSelectAction = { [weak self] in
            self?.showDetail(for: $0)
        }
        navigationController.pushViewController(controller, animated: false)
    }
    
    func showDetail(for filename: String)
    {
        let controller = DetailViewController()
        controller.selectedImage = filename
        
        navigationController.pushViewController(controller, animated: true)
    }
}

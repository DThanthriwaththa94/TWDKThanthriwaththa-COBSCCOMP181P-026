//
//  TabbedBarViewController.swift
//  NIBM_Article
//
//  Created by Bagya Hennayake on 11/22/19.
//  Copyright © 2019 NIBM. All rights reserved.
//

import UIKit
import BiometricAuthentication

class TabbedBarViewController: UITabBarController, UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        }
        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            if viewController.isKind(of: MyProfileViewController.self) {
               
                BioMetricAuthenticator.authenticateWithBioMetrics(reason: "Authentication required to access this section") { (result) in
                    
                    switch result {
                    case .success( _):
                        print("Authentication Successful")
                        self.selectedIndex = 2
                    case .failure(let error):
                        print("Authentication Failed")
                        
                    }
                }
                return false
            }
            return true
        }
        override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
            print("eeeee--\(item.tag)")
            
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

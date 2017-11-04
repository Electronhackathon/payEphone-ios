//
//  SettingController.swift
//  payEphone
//
//  Created by 윤영채 on 2017. 11. 4..
//  Copyright © 2017년 윤영채. All rights reserved.
//

import UIKit

class SettingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarItem?.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  IntroController.swift
//  payEphone
//
//  Created by 윤영채 on 2017. 11. 4..
//  Copyright © 2017년 윤영채. All rights reserved.
//

import UIKit

class BtnSegue: UIStoryboardSegue{
    override func perform() {
        
        self.source.present(self.destination, animated: true, completion: nil)
    }
}

class IntroController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


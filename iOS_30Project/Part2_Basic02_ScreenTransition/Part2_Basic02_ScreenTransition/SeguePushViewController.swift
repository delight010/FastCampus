//
//  SeguePushViewController.swift
//  Part2_Basic02_ScreenTransition
//
//  Created by Seong A Oh on 2022/05/23.
//

import UIKit

class SeguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func tabBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true) // 직전 뷰로 이동
//        self.navigationController?.popToRootViewController(animated: true) // 네비게이션 최상단 뷰로 이동
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

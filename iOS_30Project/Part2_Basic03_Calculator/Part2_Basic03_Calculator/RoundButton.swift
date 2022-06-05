//
//  RoundButton.swift
//  Part2_Basic03_Calculator
//
//  Created by Seong A Oh on 2022/06/04.
//

import UIKit

//@IBDesignable // 스토리보드에서 모양 확인가능.
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false { // 스토리보드에서 변경가능
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}

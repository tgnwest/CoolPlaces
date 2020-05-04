//
//  RatingControl.swift
//  CoolPlaces
//
//  Created by Alex Tregubov on 04.05.2020.
//  Copyright © 2020 Alex Tregubov. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    private var ratingBtns = [UIButton]()
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    var rating = 0
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    @objc func ratingBtnTapped(btn: UIButton) {
        print("Press")
    }
    
    private func setupButtons() {
        
        for btn in ratingBtns {
            removeArrangedSubview(btn)
            btn.removeFromSuperview()
        }
        
        ratingBtns.removeAll()
        
        for _ in 0..<starCount {
            let btn = UIButton()
            btn.backgroundColor = .red
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            btn.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            btn.addTarget(self, action: #selector(ratingBtnTapped(btn:)), for: .touchUpInside)
            
            addArrangedSubview(btn)
            
            ratingBtns.append(btn)
        }
        
    }
    
}

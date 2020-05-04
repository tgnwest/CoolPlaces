//
//  RatingControl.swift
//  CoolPlaces
//
//  Created by Alex Tregubov on 04.05.2020.
//  Copyright © 2020 Alex Tregubov. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    var rating = 0 {
        didSet {
            updateBtnSelectionState()
        }
    }
    
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
        guard let index = ratingBtns.firstIndex(of: btn) else {
            return
        }
        
        let selectedRating = index + 1
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    private func setupButtons() {
        
        for btn in ratingBtns {
            removeArrangedSubview(btn)
            btn.removeFromSuperview()
        }
        
        ratingBtns.removeAll()
        
        // Load btn img
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            let btn = UIButton()
            
            btn.setImage(emptyStar, for: .normal)
            btn.setImage(filledStar, for: .selected)
            btn.setImage(highlightedStar, for: .highlighted)
            btn.setImage(highlightedStar, for: [.highlighted, .selected])
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            btn.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            btn.addTarget(self, action: #selector(ratingBtnTapped(btn:)), for: .touchUpInside)
            
            addArrangedSubview(btn)
            
            ratingBtns.append(btn)
        }
        
        updateBtnSelectionState()
        
    }
    
    private func updateBtnSelectionState() {
        for (index, btn) in ratingBtns.enumerated() {
            btn.isSelected = index < rating
        }
    }
    
}

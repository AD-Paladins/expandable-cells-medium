//
//  ContactCell.swift
//  ExpandableCells
//
//  Created by Aleksander Kania on 17.04.2017.
//  Copyright © 2017 Aleksander Kania. All rights reserved.
//

import UIKit

final class LanguageCell: UITableViewCell {
    enum CellState {
        case collapsed
        case expanded
        
        var carretImage: UIImage {
            switch self {
                case .collapsed:
                    return #imageLiteral(resourceName: "expand")
                case .expanded:
                    return #imageLiteral(resourceName: "collapse")
            }
        }
    }
    
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var icon: UIImageView!
    @IBOutlet private weak var carret: UIImageView!
    
    private let expandedViewIndex: Int = 1
    
    var state: CellState = .collapsed {
        didSet {
            toggle()
        }
    }
    
    override func awakeFromNib() {
        selectionStyle = .none
        containerView.layer.cornerRadius = 5.0
    }
    
    func update(name: String, description: String, logo: UIImage) {
        titleLabel.text = name
        descriptionLabel.text = description
        icon.image = logo
    }
    
    private func toggle() {
        stackView.arrangedSubviews[expandedViewIndex].isHidden = stateIsCollapsed()
        carret.image = state.carretImage
    }
    
    private func stateIsCollapsed() -> Bool {
        return state == .collapsed
    }
}

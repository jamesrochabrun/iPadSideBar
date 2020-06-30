//
//  VerticalLabelsStackView.swift
//  iPadSidebar
//
//  Created by James Rochabrun on 6/28/20.
//

import UIKit

final class VerticalLabelsStackView: BaseXibView {
    
    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var topLabel: UILabel!
    @IBOutlet private var bottomLabel: UILabel!

    func configureWith(_ item: HeaderSubHeaderInfo) {
        topLabel?.text = item.header
        bottomLabel?.text = item.subHeader
    }
}

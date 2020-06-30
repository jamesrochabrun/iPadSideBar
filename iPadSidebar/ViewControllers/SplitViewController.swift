//
//  SplitViewController.swift
//  iPadSidebar
//
//  Created by James Rochabrun on 6/28/20.
//

import UIKit

final class SplitViewController: UISplitViewController {
    
    override init(style: UISplitViewController.Style) {
        super.init(style: style)
        self.commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        preferredDisplayMode = .twoBesideSecondary
        preferredSplitBehavior = .tile
        super.delegate = self
    }
}

extension SplitViewController: UISplitViewControllerDelegate {

}

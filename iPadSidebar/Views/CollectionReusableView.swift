//
//  CollectionReusableView.swift
//  iPadSidebar
//
//  Created by James Rochabrun on 6/28/20.
//

import UIKit

final class CollectionReusableView<T: UIView>: UICollectionReusableView {
    
    let subView: T = {
        let view = T()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    func initialize() {
        addSubview(subView)
        subView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        subView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        subView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        subView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

    }
}

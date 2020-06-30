//
//  ProfileDataView.swift
//  iPadSidebar
//
//  Created by James Rochabrun on 6/28/20.
//

import UIKit

final class ProfileDataView: BaseXibView {
    
    @IBOutlet private var photosDataView: VerticalLabelsStackView!
    @IBOutlet private var followersView: VerticalLabelsStackView!
    @IBOutlet private var followingView: VerticalLabelsStackView!

    func configureWith(_ item: UserDataStackViewModel) {
        photosDataView.configureWith(item.photoDataInfo)
        followersView.configureWith(item.followersDataInfo)
        followingView.configureWith(item.followingDataInfo)
    }
}

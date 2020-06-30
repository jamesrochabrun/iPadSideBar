//
//  ProfileInfoView.swift
//  iPadSidebar
//
//  Created by James Rochabrun on 6/28/20.
//

import UIKit

final class ProfileInfoView: BaseXibView {
    
    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var profileDataView: ProfileDataView!
    @IBOutlet private var profileDescriptionStackView: VerticalLabelsStackView!
    
    override func setUpViews() {
        super.setUpViews()
    }
    
    func configureWith(_ viewModel: UserProfileViewModel) {
        profileImageView?.image = viewModel.userAvatar
        profileDataView?.configureWith(viewModel.userDataStackViewModel)
        profileDescriptionStackView?.configureWith(viewModel.profileDescription)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView?.circle()
        profileImageView?.setupGradient(cornerRadius: profileImageView?.layer.cornerRadius ?? 0)
    }
}

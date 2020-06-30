//
//  UserProfileViewModel.swift
//  iPadSidebar
//
//  Created by James Rochabrun on 6/28/20.
//

import UIKit

struct UserProfileViewModel {
    
    var userAvatar: UIImage?
    let userDataStackViewModel: UserDataStackViewModel
    let profileDescription: HeaderSubHeaderInfo
    
    static var stub: UserProfileViewModel {
        let userCountsData = UserDataStackViewModel(photoDataInfo: UserDataViewModel(numberInfo: "100", sectionInfoTitle: "Photos"),
                                                    followersDataInfo: UserDataViewModel(numberInfo: "250", sectionInfoTitle: "Followers"),
                                                    followingDataInfo: UserDataViewModel(numberInfo: "300", sectionInfoTitle: "Following"))
        let profileDescription = UserProfileDescription(userName: "Dolores 🤖🦾🦿", userPersonalDescription: "")
        
        return UserProfileViewModel(userAvatar: UIImage(named: "dolores"),
                             userDataStackViewModel: userCountsData,
                             profileDescription: profileDescription)
    }
}

struct UserDataViewModel {
    
    let numberInfo: String
    let sectionInfoTitle: String
}

extension UserDataViewModel: HeaderSubHeaderInfo {
    var header: String { numberInfo }
    var subHeader: String { sectionInfoTitle }
}


struct UserDataStackViewModel {
    
    let photoDataInfo: UserDataViewModel
    let followersDataInfo: UserDataViewModel
    let followingDataInfo: UserDataViewModel
}


/**
- Remark:- viewModel  user name and personal description
*/
struct UserProfileDescription {
    let userName: String
    let userPersonalDescription: String
}

extension UserProfileDescription: HeaderSubHeaderInfo {
    
    var header: String { userName }
    var subHeader: String { userPersonalDescription }
}

// MARK:- Protocol
/**
- Remark:- protocol that allows UI reusability.
*/
protocol HeaderSubHeaderInfo {
    var header: String { get }
    var subHeader: String { get }
}


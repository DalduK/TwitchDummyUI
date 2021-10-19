//
//  TwitchModels.swift
//  TwitchDummy
//
//  Created by Przemysław Woźny on 19/10/2021.
//

import Foundation

public struct Categories: Identifiable {
    public let id = UUID()
    let name: String
    let viewers: String
}

public struct FollowedLiveTransmition: Identifiable {
    public let id = UUID()
    let name: String
    let user: TwitchUser
    let category: Categories
    let filters: [String]
}

public struct ProposedLiveTransmition: Identifiable{
    public let id = UUID()
    let name: String
    let user: TwitchUser
    let category: Categories
    let filters: [String]
}

public struct PastTransmition: Identifiable {
    public let id = UUID()
    let name: String
    let user: TwitchUser
    let category: Categories
}

public struct TwitchUser {
    let name: String
    let iconName: String
}

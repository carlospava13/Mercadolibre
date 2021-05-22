//
//  BaseRepository.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

public class BaseRepository {
    var endPointBuilder: EndPointBuilder
    var apiClient: APIClienting
    public init(endPointBuilder: EndPointBuilder = EndPointBuilder(),
                apiClient: APIClienting = APIClient()) {
        self.endPointBuilder = endPointBuilder
        self.apiClient = apiClient
    }
}

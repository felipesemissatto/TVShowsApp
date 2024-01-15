//
//  String+RemoveHTMLTags.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import Foundation

extension String {
    var withoutHtmlTags: String {
        return self.replacingOccurrences(of: "<[^>]+>",
                                         with: "",
                                         options: .regularExpression,
                                         range: nil).replacingOccurrences(of: "&[^;]+;",
                                                                          with: "",
                                                                          options:.regularExpression,
                                                                          range: nil)
    }
}

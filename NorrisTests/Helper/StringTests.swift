//
//  StringTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 14/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble

@testable import Norris

class StringTests: QuickSpec {
    override func spec() {
        describe("#addLineSpacing") {
            it("returns attributedString with line spacing") {
                let attributedString = "string".addLineSpacing(7)
                
                let attributed = attributedString.attributes(at: 0, effectiveRange: nil).first
                let paragraphStyle = attributed?.value as? NSParagraphStyle
                
                expect(attributed?.key).to(equal(.paragraphStyle))
                expect(paragraphStyle?.lineSpacing).to(equal(7))
            }
        }
    }
}

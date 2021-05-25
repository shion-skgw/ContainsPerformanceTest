//
//  ViewController.swift
//  ContainsPerformanceTest
//
//  Created by Shion on 2021/05/25.
//

import UIKit

class ViewController: UIViewController {

    /// ASCIIコード上の記号類
    static let asciiSymboles = " !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"

    /// 記号のArray
    let array: [Character] = ViewController.asciiSymboles.map({ $0 })
    /// Arrayでcontainsするケース
    func containsOfArray(_ text: String) -> Bool {
        return text.contains(where: { array.contains($0) })
    }

    /// 記号のSet
    let set: Set<Character> = Set(ViewController.asciiSymboles.map({ $0 }))
    /// Setでcontainsするケース
    func containsOfSet(_ text: String) -> Bool {
        return text.contains(where: { set.contains($0) })
    }

    /// 記号のCharacterSet
    let characterSet: CharacterSet = CharacterSet(charactersIn: ViewController.asciiSymboles)
    /// CharacterSetでcontainsするケース
    func containsOfCharacterSet(_ text: String) -> Bool {
        return text.unicodeScalars.contains(where: { characterSet.contains($0) })
    }

    /// 許容文字だけチェック正規表現
    let regularExpression: NSRegularExpression = try! NSRegularExpression(pattern: "[^0-9a-zA-Z]")
    /// firstMatchの有無チェックするケース
    func containsOfRegularExpression(_ text: String, _ range: NSRange) -> Bool {
        return regularExpression.firstMatch(in: text, range: range) != nil
    }

    /// 禁則文字1文字だけ
    let test1 = "<"
    /// 禁則文字の含まれる長い文字列
    let test2 = "TestTextTestTextTestTextTestTextTestTextTestText<script>console.log('TestText')</script>"

    override func viewDidLoad() {
        super.viewDidLoad()

        /* 禁則文字1文字だけ */

        /*
         containsOfArray
         0.5411179065704346
         0.5338408946990967
         0.5369839668273926
         */
        print("containsOfArray")
        var start = Date()
        for _ in 1...100000 {
            _ = containsOfArray(test1)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfArray(test1)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfArray(test1)
        }
        print(Date().timeIntervalSince(start))

        /*
         containsOfSet
         0.0809410810470581
         0.07425105571746826
         0.06472694873809814
         */
        print()
        print("containsOfSet")
        start = Date()
        for _ in 1...100000 {
            _ = containsOfSet(test1)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfSet(test1)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfSet(test1)
        }
        print(Date().timeIntervalSince(start))

        /*
         containsOfCharacterSet
         0.06927597522735596
         0.06671404838562012
         0.06792700290679932
         */
        print()
        print("containsOfCharacterSet")
        start = Date()
        for _ in 1...100000 {
            _ = containsOfCharacterSet(test1)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfCharacterSet(test1)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfCharacterSet(test1)
        }
        print(Date().timeIntervalSince(start))

        /*
         containsOfRegularExpression
         0.2697739601135254
         0.2776550054550171
         0.27230799198150635
         */
        print()
        print("containsOfRegularExpression")
        var nsRange = NSMakeRange(.zero, test1.utf16.count)
        start = Date()
        for _ in 1...100000 {
            _ = containsOfRegularExpression(test1, nsRange)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfRegularExpression(test1, nsRange)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfRegularExpression(test1, nsRange)
        }
        print(Date().timeIntervalSince(start))

        /* 禁則文字の含まれる長い文字列 */

        /*
         containsOfArray
         39.507619976997375
         39.294448018074036
         39.208788990974426
         */
        print()
        print("containsOfArray")
        start = Date()
        for _ in 1...100000 {
            _ = containsOfArray(test2)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfArray(test2)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfArray(test2)
        }
        print(Date().timeIntervalSince(start))

        /*
         containsOfSet
         0.6243489980697632
         0.6374111175537109
         0.6388330459594727
         */
        print()
        print("containsOfSet")
        start = Date()
        for _ in 1...100000 {
            _ = containsOfSet(test2)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfSet(test2)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfSet(test2)
        }
        print(Date().timeIntervalSince(start))

        /*
         containsOfCharacterSet
         0.3220090866088867
         0.3155949115753174
         0.3126000165939331
         */
        print()
        print("containsOfCharacterSet")
        start = Date()
        for _ in 1...100000 {
            _ = containsOfCharacterSet(test2)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfCharacterSet(test2)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfCharacterSet(test2)
        }
        print(Date().timeIntervalSince(start))

        /*
         containsOfRegularExpression
         0.3339569568634033
         0.33009397983551025
         0.34034299850463867
         */
        print()
        print("containsOfRegularExpression")
        nsRange = NSMakeRange(.zero, test2.utf16.count)
        start = Date()
        for _ in 1...100000 {
            _ = containsOfRegularExpression(test2, nsRange)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfRegularExpression(test2, nsRange)
        }
        print(Date().timeIntervalSince(start))
        start = Date()
        for _ in 1...100000 {
            _ = containsOfRegularExpression(test2, nsRange)
        }
        print(Date().timeIntervalSince(start))
    }

}

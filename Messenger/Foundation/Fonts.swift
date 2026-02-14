import UIKit

extension UIFont {
    static func arimoFont(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "Arimo", size: size) ?? .systemFont(ofSize: size, weight: .regular)
    }
    
    // Paragraphs Fonts
    static let paragraph = arimoFont(ofSize: 34.0)
    
    // Headers Fonts
    static let header1 = arimoFont(ofSize: 28.0)
    static let header2 = arimoFont(ofSize: 24.0)
    static let header3 = arimoFont(ofSize: 20.0)
    
    // Body Fonts
    static let body = arimoFont(ofSize: 17.0)
    
    // PlainTexts Fonts
    static let plainText1 = arimoFont(ofSize: 15.0)
    static let plainText2 = arimoFont(ofSize: 13.0)
}

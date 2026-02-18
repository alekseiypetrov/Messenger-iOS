import UIKit

enum LogoScreenType {
    case authorization
    case accountRegistration
    case mailConfirmation
    case accountRecovery
    case passwordReset
    
    var image: UIImage {
        switch self {
        case .authorization, .accountRegistration:
            return .helloIcon
        case .accountRecovery:
            return .clockIcon
        case .mailConfirmation:
            return .mailIcon
        case .passwordReset:
            return .successIcon
        }
    }
    
    var sizeOfImage: CGFloat {
        switch self {
        case .authorization, .accountRegistration:
            return 32.0
        default:
            return 48.0
        }
    }
}

import UIKit

enum TextFieldType {
    case login
    case email
    case tag
    case password
    case newPassword
    case confirmingPassword
    case name
    case surname
    
    var placeholder: String {
        switch self {
        case .login:
            return "Тег или email"
        case .email:
            return "your@email.com"
        case .tag:
            return "username"
        case .password:
            return "Пароль"
        case .newPassword:
            return "Минимум 8 символов"
        case .confirmingPassword:
            return "Повторите пароль"
        case .name:
            return "Иван"
        case .surname:
            return "Иванов"
        }
    }
    
    var title: String {
        switch self {
        case .password:
            return "Пароль"
        case .newPassword:
            return "Новый пароль"
        case .confirmingPassword:
            return "Подтверждение пароля"
        case .email:
            return "Email"
        case .name:
            return "Имя"
        case .surname:
            return "Фамилия"
        case .tag:
            return "Тег"
        default:
            return ""
        }
    }
    
    var footer: String {
        switch self {
        case .tag:
            return "Только латиница, цифры и подчеркивание"
        default:
            return ""
        }
    }
    
    var isSecure: Bool {
        switch self {
        case .password, .newPassword, .confirmingPassword:
            return true
        default:
            return false
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .login, .email:
            return .emailAddress
        default:
            return .default
        }
    }
}

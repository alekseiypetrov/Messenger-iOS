import UIKit

final class AuthViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let borderWidth: CGFloat = 1.0
        static let buttonCornerRadius: CGFloat = 14.0
        
        enum AttributedTitles {
            static let logInButton = NSAttributedString(
                string: "Войти",
                attributes: [
                    .font: UIFont.body,
                    .foregroundColor: UIColor.white,
                ]
            )
            static let forgotPasswordButton = NSAttributedString(
                string: "Забыл пароль",
                attributes: [
                    .font: UIFont.body,
                    .foregroundColor: UIColor.mBlue,
                ]
            )
            static let registrationButton = NSAttributedString(
                string: "Зарегистрироваться",
                attributes: [
                    .font: UIFont.body,
                    .foregroundColor: UIColor.mBlue,
                ]
            )
        }
        
        enum Heights {
            static let forHintLabel: CGFloat = 26.0
            static let forGreetingLabel: CGFloat = 51.0
            static let forButtons: CGFloat = 58.0
        }
    }
    
    // MARK: - UI-elements
    
    private lazy var imageView: LogoScreenView = {
        LogoScreenView(typeOfScreen: .authorization)
    }()
    
    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать"
        label.font = UIFont.paragraph
        label.textAlignment = .center
        return label
    }()
    
    private lazy var hintLabel: UILabel = {
        let label = UILabel()
        label.text = "Войдите, чтобы продолжить"
        label.font = UIFont.body
        label.textAlignment = .center
        label.textColor = .mText
        return label
    }()
    
    private lazy var loginField: TextFieldView = TextFieldView(typeOfField: .login, isInProfile: false)

    private lazy var passwordField: TextFieldView = TextFieldView(typeOfField: .password, isInProfile: false)
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(
            Constants.AttributedTitles.logInButton,
            for: .normal
        )
        button.backgroundColor = .mBlue
        button.layer.cornerRadius = Constants.buttonCornerRadius
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(
            Constants.AttributedTitles.forgotPasswordButton,
            for: .normal
        )
        return button
    }()
    
    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(
            Constants.AttributedTitles.registrationButton,
            for: .normal
        )
        button.backgroundColor = .clear
        button.layer.borderWidth = Constants.borderWidth
        button.layer.borderColor = UIColor.mBlue.cgColor
        button.layer.cornerRadius = Constants.buttonCornerRadius
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        view.backgroundColor = .mBackground
        view.addSubviews([
            imageView, greetingLabel, hintLabel, 
            loginField, passwordField,
            logInButton, forgotPasswordButton,
            registrationButton
        ])
    }
    
    private func setupConstraints() { 
        [loginField, passwordField,
         logInButton, forgotPasswordButton,
         registrationButton]
            .forEach{
                $0.constraintEdges(to: view, withValue: 24.0)
            }
        
        NSLayoutConstraint.activate([
            
            // Logo constraints
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 96),
            
            // Greeteng Label constraints
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            greetingLabel.heightAnchor.constraint(equalToConstant: Constants.Heights.forGreetingLabel),
            
            // Hint Label constraints
            hintLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hintLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 8),
            hintLabel.heightAnchor.constraint(equalToConstant: Constants.Heights.forHintLabel),
            
            // Login TextField constraints
            loginField.topAnchor.constraint(equalTo: hintLabel.bottomAnchor, constant: 48),
            
            // Password TextField constraints
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 16),
            
            // Log In Button constraints
            logInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 24),
            logInButton.heightAnchor.constraint(equalToConstant: Constants.Heights.forButtons),
            
            // Button "Forgot password" constraints
            forgotPasswordButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 16),
            
            // Button "Register" constraints
            registrationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            registrationButton.heightAnchor.constraint(equalTo: logInButton.heightAnchor),
        ])
    }
}

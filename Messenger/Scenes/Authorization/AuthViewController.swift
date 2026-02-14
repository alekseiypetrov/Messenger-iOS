import UIKit

final class AuthViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let borderWidth: CGFloat = 1.0
        static let buttonCornerRadius: CGFloat = 14.0
    }
    
    // MARK: - UI-elements
    
    private lazy var imageView: LogoScreenView = {
        let view = LogoScreenView(typeOfScreen: .authorization)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать"
        // TODO: - Шрифт, выравнивание, цвет
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 51).isActive = true
        return label
    }()
    
    private lazy var hintLabel: UILabel = {
        let label = UILabel()
        label.text = "Войдите, чтобы продолжить"
        // TODO: - Шрифт, выравнивание, цвет
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 26).isActive = true
        return label
    }()
    
    private lazy var loginField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .mField
        textField.placeholder = "Тег или email"
        // TODO: - Шрифт, выравнивание
        textField.layer.cornerRadius = Constants.buttonCornerRadius
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 58).isActive = true
        return textField
    }()
    
    private lazy var passwordField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .mField
        textField.placeholder = "Пароль"
        // TODO: - Шрифт, выравнивание, кнопка и стиль ввода
        textField.layer.cornerRadius = Constants.buttonCornerRadius
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 58).isActive = true
        return textField
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        // TODO: - Шрифт
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .mBlue
        button.layer.cornerRadius = Constants.buttonCornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 58).isActive = true
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        // TODO: - Шрифт, цвет
        button.setTitle("Забыл пароль", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        // TODO: - Шрифт, цвет
        button.setTitle("Зарегистрироваться", for: .normal)
        button.backgroundColor = .clear
        button.layer.borderWidth = Constants.borderWidth
        button.layer.borderColor = UIColor.mBlue.cgColor
        button.layer.cornerRadius = Constants.buttonCornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 58).isActive = true
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
        [imageView, greetingLabel, hintLabel, loginField, passwordField, logInButton, forgotPasswordButton, registrationButton]
            .forEach{
                view.addSubview($0)
            }
    }
    
    private func setupConstraints() { 
        NSLayoutConstraint.activate([
            
            // Logo constraints
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 96),
            
            // Greeteng Label constraints
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            
            // Hint Label constraints
            hintLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hintLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 8),
            
            // Login TextField constraints
            loginField.topAnchor.constraint(equalTo: hintLabel.bottomAnchor, constant: 48),
            loginField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            // Password TextField constraints
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 16),
            passwordField.leadingAnchor.constraint(equalTo: loginField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: loginField.trailingAnchor),
            
            // Log In Button constraints
            logInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 24),
            logInButton.leadingAnchor.constraint(equalTo: loginField.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: loginField.trailingAnchor),
            
            // Button "Forgot password" constraints
            forgotPasswordButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 16),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: loginField.leadingAnchor),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: loginField.trailingAnchor),
            
            // Button "Register" constraints
            registrationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            registrationButton.leadingAnchor.constraint(equalTo: loginField.leadingAnchor),
            registrationButton.trailingAnchor.constraint(equalTo: loginField.trailingAnchor),
        ])
    }
}

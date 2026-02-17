import UIKit

final class AccountRegistrationViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let cornerRadius: CGFloat = 14.0
        
        enum Spacing {
            static let horizontal: CGFloat = 12.0
            static let vertical: CGFloat = 16.0
        }
        
        enum AttributedTitles {
            static let registrationButtonTitle = NSAttributedString(
                string: "Создать аккаунт",
                attributes: [
                    .font: UIFont.body,
                    .foregroundColor: UIColor.white,
                ]
            )
            static let usageConditionsButtonTitle = NSAttributedString(
                string: "Условиями использования и",
                attributes: [
                    .font: UIFont.body,
                    .foregroundColor: UIColor.mBlue,
                ]
            )
            static let privacyPolicyButtonTitle = NSAttributedString(
                string: "Политикой конфиденциальности",
                attributes: [
                    .font: UIFont.body,
                    .foregroundColor: UIColor.mBlue,
                ]
            )
        }
    }
    
    // MARK: - UI-elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.font = .header3
        label.textAlignment = .center
        return label
    }()
    
    private lazy var logoView: LogoScreenView = LogoScreenView(typeOfScreen: .accountRegistration)
    
    private lazy var hintToTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Создайте свой аккаунт"
        label.textColor = .mText
        label.font = .body
        label.textAlignment = .center
        return label
    }()
    
    private lazy var emailField: TitledTextFieldView = TitledTextFieldView(type: .email, isInProfile: false)
    private lazy var nameField: TitledTextFieldView = TitledTextFieldView(type: .name, isInProfile: false)
    private lazy var surnameField: TitledTextFieldView = TitledTextFieldView(type: .surname, isInProfile: false)
    private lazy var tagField: TitledTextFieldView = TitledTextFieldView(type: .tag, isInProfile: false)
    private lazy var passwordField: TitledTextFieldView = TitledTextFieldView(type: .newPassword, isInProfile: false)
    private lazy var confirmingPasswordField: TitledTextFieldView = TitledTextFieldView(type: .confirmingPassword, isInProfile: false)
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = Constants.Spacing.vertical
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = Constants.Spacing.horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = Constants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = .mBlue
        button.setAttributedTitle(Constants.AttributedTitles.registrationButtonTitle, for: .normal)
        button.addTarget(nil, action: #selector(registerButonPushed), for: .touchUpInside)
        return button
    }()
    
    private lazy var starringLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрируясь, вы соглашаетесь с"
        label.font = .plainText2
        label.textAlignment = .center
        return label
    }()
    
    private lazy var usageConditionsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setAttributedTitle(Constants.AttributedTitles.usageConditionsButtonTitle, for: .normal)
        button.addTarget(nil, action: #selector(showUsageConditions), for: .touchUpInside)
        return button
    }()
    
    private lazy var privacyPolicyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setAttributedTitle(Constants.AttributedTitles.privacyPolicyButtonTitle, for: .normal)
        button.addTarget(nil, action: #selector(showPrivacyPolicy), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    // MARK: - Actions
    
    @objc
    private func registerButonPushed() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc 
    private func showUsageConditions() { }
    
    @objc
    private func showPrivacyPolicy() { }
    
    // MARK: - Private methods
    
    private func setupView() {
        navigationItem.titleView = titleLabel
        navigationItem.backButtonDisplayMode = .minimal
        view.backgroundColor = .mBackground
        view.addSubviews([logoView, hintToTypeLabel, vStack, registrationButton, starringLabel, usageConditionsButton, privacyPolicyButton])
        [nameField, surnameField]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                hStack.addArrangedSubview($0)
            }
        [emailField, hStack, tagField, passwordField, confirmingPasswordField]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                vStack.addArrangedSubview($0)
                $0.constraintEdges(to: vStack, withValue: 0.0)
            }
    }
    
    private func setupConstraints() {
        [hintToTypeLabel, vStack, registrationButton, starringLabel, usageConditionsButton, privacyPolicyButton]
            .forEach{
                $0.constraintEdges(to: view, withValue: 24.0)
            }
        NSLayoutConstraint.activate([
            
            // Logo View Constraints
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            
            // Hint To Type Label Constraints
            hintToTypeLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 16.0),
            hintToTypeLabel.heightAnchor.constraint(equalToConstant: 26.0),
            
            // Vertical Stack Constraints
            vStack.topAnchor.constraint(equalTo: hintToTypeLabel.bottomAnchor, constant: 32.0),
            vStack.bottomAnchor.constraint(equalTo: registrationButton.topAnchor, constant: -32.0),
            
            // Registration Button Constraints
            registrationButton.heightAnchor.constraint(equalToConstant: 58.0),
            
            // starringLabel, usageConditionsButton, privacyPolicyButton Constraints
            starringLabel.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 16.0),
            starringLabel.heightAnchor.constraint(equalToConstant: 20.0),
            usageConditionsButton.topAnchor.constraint(equalTo: starringLabel.bottomAnchor, constant: 1.0),
            usageConditionsButton.heightAnchor.constraint(equalToConstant: 24.0),
            privacyPolicyButton.topAnchor.constraint(equalTo: usageConditionsButton.bottomAnchor, constant: 2.0),
            privacyPolicyButton.heightAnchor.constraint(equalToConstant: 24.0),
        ])
    }
}

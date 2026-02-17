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
    
    private lazy var emailField: TitledTextFieldView = {
        let view = TitledTextFieldView(type: .email, isInProfile: false)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameField: TitledTextFieldView = {
        let view = TitledTextFieldView(type: .name, isInProfile: false)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var surnameField: TitledTextFieldView = {
        let view = TitledTextFieldView(type: .surname, isInProfile: false)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tagField: TitledTextFieldView = {
        let view = TitledTextFieldView(type: .tag, isInProfile: false)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var passwordField: TitledTextFieldView = {
        let view = TitledTextFieldView(type: .newPassword, isInProfile: false)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var confirmingPasswordField: TitledTextFieldView = {
        let view = TitledTextFieldView(type: .confirmingPassword, isInProfile: false)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailField, hStack, tagField, passwordField, confirmingPasswordField])
        stack.axis = .vertical
        stack.spacing = Constants.Spacing.vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var hStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameField, surnameField])
        stack.axis = .horizontal
        stack.spacing = Constants.Spacing.horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
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
        label.textColor = .mText
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
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = true
        scroll.backgroundColor = .mBackground
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupScrollView()
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
    
    private func setupNavigationBar() {
        navigationItem.titleView = titleLabel
        navigationItem.backButtonDisplayMode = .minimal
    }
    
    private func setupView() {
        view.backgroundColor = .mBackground
        view.addSubviews([scrollView])
    }
    
    private func setupScrollView() {
        scrollView.addSubviews([contentView])
        contentView.addSubviews([logoView, hintToTypeLabel, vStack, registrationButton, starringLabel, usageConditionsButton, privacyPolicyButton])
    }
    
    private func setupConstraints() {
        scrollView.constraintEdges(to: view, withValue: 0.0)
        contentView.constraintEdges(to: scrollView, withValue: 0.0)
        [emailField, hStack, tagField, passwordField, confirmingPasswordField]
            .forEach{
                $0.constraintEdges(to: vStack, withValue: 0.0)
            }
        [hintToTypeLabel, vStack, registrationButton, starringLabel, usageConditionsButton, privacyPolicyButton]
            .forEach{
                $0.constraintEdges(to: contentView, withValue: 24.0)
            }
        NSLayoutConstraint.activate([
            
            // ScrollView Constraints
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // ContentView Constraints
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Logo View Constraints
            logoView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            
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
            privacyPolicyButton.topAnchor.constraint(equalTo: usageConditionsButton.bottomAnchor, constant: 1.0),
            privacyPolicyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20.0),
        ])
    }
}

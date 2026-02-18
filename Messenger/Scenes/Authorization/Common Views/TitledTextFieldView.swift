import UIKit

final class TitledTextFieldView: UIView {
    
    // MARK: - UI-elements
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = self.type.title
        label.font = .plainText2
        label.textAlignment = .left
        label.textColor = .mText
        return label
    }()
    
    private lazy var textField: TextFieldView = TextFieldView(typeOfField: self.type, isInProfile: self.isInProfile)
    
    private lazy var footer: UILabel = {
        let label = UILabel()
        label.text = self.type.footer
        label.font = .plainText2
        label.textAlignment = .left
        label.textColor = .mText
        return label
    }()
    
    // MARK: - Private properties
    
    private let type: TextFieldType
    private let isInProfile: Bool
    
    // MARK: - Initializers
    
    init(type: TextFieldType, isInProfile: Bool) {
        self.type = type
        self.isInProfile = isInProfile
        super.init(frame: .zero)
        setupView()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Private methods
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .mBackground
        var views = [title, textField]
        if type == .tag {
            views.append(footer)
        }
        addSubviews(views)
    }
    
    private func setupConstrains() {
        var constraints = [
            
            // Title Label Constraints
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.heightAnchor.constraint(equalToConstant: 20.0),
            
            // TextField Constraints
            textField.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4.0),
        ]
        if type == .tag {
            constraints.append(contentsOf: [
                
                // Footer Constraints
                footer.leadingAnchor.constraint(equalTo: title.leadingAnchor),
                footer.trailingAnchor.constraint(equalTo: title.trailingAnchor),
                footer.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 4.0),
                footer.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        } else {
            constraints.append(textField.bottomAnchor.constraint(equalTo: bottomAnchor))
        }
        
        textField.constraintEdges(to: self, withValue: 0.0)
        NSLayoutConstraint.activate(constraints)
    }
}

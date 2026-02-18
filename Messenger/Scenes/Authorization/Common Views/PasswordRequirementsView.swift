import UIKit

final class PasswordRequirementsView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let cornerRadius: CGFloat = 14.0
        static let cellTitles = [
            "Минимум 8 символов",
            "Пароли совпадают",
        ]
        
        enum Heights {
            static let forTitle: CGFloat = 20.0
            static let forRowInTable: CGFloat = 24.0
        }
    }
    
    // MARK: - UI-elements
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Требования к паролю:"
        label.font = .plainText2
        label.textAlignment = .left
        label.textColor = .mText
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = Constants.Heights.forRowInTable
        table.allowsSelection = false
        table.isScrollEnabled = false
        table.separatorStyle = .none
        table.dataSource = self
        table.register(PasswordReqirementCell.self, forCellReuseIdentifier: PasswordReqirementCell.identifier)
        return table
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Private methods
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .mField
        layer.cornerRadius = Constants.cornerRadius
        clipsToBounds = true
        addSubviews([title, tableView])
    }
    
    private func setupConstrains() {
        [title, tableView]
            .forEach{
                $0.constraintEdges(to: self, withValue: 16.0)
            }
        NSLayoutConstraint.activate([
            
            // Title Label Constraints
            title.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            title.heightAnchor.constraint(equalToConstant: Constants.Heights.forTitle),
            
            // TableView Constrains
            tableView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8.0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0),
        ])
    }
}

// MARK: - PasswordRequirementsView + UITableViewDataSource

extension PasswordRequirementsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PasswordReqirementCell.identifier) as? PasswordReqirementCell
        else { return UITableViewCell() }
        cell.text = Constants.cellTitles[indexPath.row]
        return cell
    }
    
    func updateCell(at row: Int, isCompleted: Bool) {
        let indexPath = IndexPath(row: row, section: 0)
        guard let cell = tableView.cellForRow(at: indexPath) as? PasswordReqirementCell else { return }
        cell.image = isCompleted ? .successCircleIcon : .filledCircleIcon
    }
}

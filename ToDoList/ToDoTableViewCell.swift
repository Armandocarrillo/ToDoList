//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by Armando Carrillo on 26/07/20.
//  Copyright © 2020 Armando Carrillo. All rights reserved.
//

import UIKit

protocol ToDoCellDelegate {
    func checkMarkTapped(_ sender: ToDoTableViewCell)
}

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    
    var delegate : ToDoCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        delegate?.checkMarkTapped(self)
    }
    
}

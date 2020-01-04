//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Nicholas Fox on 1/3/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import SwiftUI


struct AddExpenseView: View {

  @Environment(\.presentationMode) var presentationMode

  @ObservedObject var expenses: Expenses

  @State private var name: String = ""
  @State private var type: String = "Personal"
  @State private var amount: String = ""

  private static let expenseTypes = ["Personal", "Business"]

  var body: some View {
    NavigationView {
      Form {
        TextField("Name", text: $name)
        Picker("Type", selection: $type) {
          ForEach(Self.expenseTypes, id: \.self) {
            Text($0)
          }
        }
        TextField("Amount", text: $amount)
          .keyboardType(.numberPad)
      }
      .navigationBarTitle("Add New Expense")
      .navigationBarItems(trailing:
        Button(action: {
          guard let realAmount = Int(self.amount) else { return }
          let expense = ExpenseItem(
            name: self.name,
            type: self.type,
            amount: realAmount)
          self.expenses.items.append(expense)
          self.presentationMode.wrappedValue.dismiss()
        }) {
          Text("Save")
        }
      )
    }
  }
}

struct AddExpenseView_Previews: PreviewProvider {
  static var previews: some View {
    AddExpenseView(expenses: Expenses())
  }
}

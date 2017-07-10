class AddNoteToForms < ActiveRecord::Migration[5.1]
  def change
    add_column :forms, :note, :string
  end
end

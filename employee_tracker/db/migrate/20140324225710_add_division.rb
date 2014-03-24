class AddDivision < ActiveRecord::Migration
  def change
      create_table :division do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end

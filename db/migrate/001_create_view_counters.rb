class CreateViewCounters < ActiveRecord::Migration::Current
  def change
    create_table :view_counters do |t|
      t.belongs_to :issue
      t.integer :count, null: false, default: 0

      t.timestamps
    end
  end
end

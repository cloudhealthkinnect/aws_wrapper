ActiveRecord::Schema.define do
  self.verbose = false

  create_table :locations, :force => true do |t|
    t.string :name
    t.string :state
    t.string :street
    t.string :suburb
    t.string :organisation_id

    t.timestamps
  end
end

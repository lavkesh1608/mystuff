class CreateStuffsecurities < ActiveRecord::Migration
  def change
    create_table :stuffsecurities do |t|
      t.integer :stuf_id
      t.string :bill_no
      t.string :emi_no
      t.string :insurance_no
      t.string :pan_no
      t.string :license_no
      t.string :registration_no
      t.string :chasis_no
      t.string :ins_valid_till
      t.string :has_insurance

      t.timestamps
    end
  end
end

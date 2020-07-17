class CreateEstimates < ActiveRecord::Migration[5.0]
  def change
    create_table :estimates do |t|
      t.timestamps
      t.references :user, foreign_key: true
      t.string :customer, null:false
      t.datetime :get, null:false
      t.datetime :deadline, null:false
      t.string :name, null:false
      t.string :figure_number, null:false
      t.string :make, null:false
      t.string :metal, null:false
      t.datetime :start
      t.string :use
      t.integer :quantity, null:false
      t.integer :sell_price, null:false
      t.integer :purchase_price, null:false
      t.integer :profit, null:false
      t.integer :sell_price_total, null:false
      t.integer :profit_total, null:false
      t.text :remark
      t.integer :probability_id, null:false
      t.integer :status_id, null:false
    end
  end
end

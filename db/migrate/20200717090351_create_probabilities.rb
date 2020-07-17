class CreateProbabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :probabilities do |t|

      t.timestamps
    end
  end
end

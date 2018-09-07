class CreateJoinTableMachineSnacks < ActiveRecord::Migration[5.1]
  def change
    create_join_table :machines, :snacks do |t|
       t.index [:machine_id, :snack_id]
       t.index [:snack_id, :machine_id]
    end
  end
end

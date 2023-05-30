class DropCarsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :cars if table_exists?(:cars)
  end

  def down
    # Se você quiser reverter essa migração no futuro, você pode adicionar o código para criar novamente a tabela aqui
    # Por exemplo:
    # create_table :cars do |t|
    #   t.string :brand
    #   t.string :model
    #   t.integer :price
    #   t.references :user, foreign_key: true
    #   t.timestamps
    # end
  end
end

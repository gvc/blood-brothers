class DeviseCreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table(:usuarios) do |t|
      t.string :nome
      t.string :tipo_sanguineo
      t.integer :cidade_id
      t.string :fator_rh
      t.date :data_ultima_doacao
      
      t.database_authenticatable null: false
      t.recoverable
      t.rememberable
      t.confirmable
      
      t.timestamps
    end

    add_index :usuarios, :email,                :unique => true
    add_index :usuarios, :reset_password_token, :unique => true
    add_index :usuarios, :confirmation_token,   :unique => true
  end

  def self.down
    drop_table :usuarios
  end
end

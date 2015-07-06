class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.column :body, :string
      t.column :user_id, :integer
      t.column :question_id, :integer
      t.timestamps
    end
  end
end

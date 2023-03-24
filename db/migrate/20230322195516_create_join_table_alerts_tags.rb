class CreateJoinTableAlertsTags < ActiveRecord::Migration[7.0]
  def change
    create_join_table :alerts, :tags do |t|
      # t.index [:alert_id, :tag_id]
      # t.index [:tag_id, :alert_id]
    end
  end
end

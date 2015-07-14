class PostTags < ActiveRecord::Migration
  def change
  	create_table :post_tags do |t|
  		t.integer :tag_id, :post_id
  	end
  end
end

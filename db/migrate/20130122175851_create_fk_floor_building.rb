class CreateFkFloorBuilding < ActiveRecord::Migration
  def up

   #add a foreign key
    execute <<-SQL
      ALTER TABLE floors
        ADD CONSTRAINT fk_floors_buildings
        FOREIGN KEY (building_id)
        REFERENCES buildings(id)
    SQL
          	
  end

  def down
    execute <<-SQL
      ALTER TABLE floors
        DROP FOREIGN KEY fk_floors_buildings
    SQL

  end
end

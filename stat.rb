Dir.glob(RAILS_ROOT + '/app/models/*.rb').each { |file| require file }
  @models = Object.subclasses_of(ActiveRecord::Base).select { |model| 
   model.name[-4..-1] == "Cube"
  }
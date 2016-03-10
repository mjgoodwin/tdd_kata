class MaterialType
  def self.build(material)
    begin
      Object.const_get("#{material.capitalize}Material")
    rescue
      UnknownMaterial
    end.new
  end
end

class UnknownMaterial
  def markup
    0
  end
end

class FoodMaterial
  def markup
    0.13
  end
end

class ElectronicsMaterial
  def markup
    0.02
  end
end

class DrugsMaterial
  def markup
    0.075
  end
end

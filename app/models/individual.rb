class Individual
  include ActiveModel::Model
  include ActiveModel::Serializers::JSON

  attr_accessor :pokemon_id, :name, :nature, :ability, :effort_values, :moves, :base
  
  validates :pokemon_id, presence: true, numericality: { only_integer: true }
  validates :name, presence: true
  validates :nature, presence: true
  validates :ability, presence: true
  validates :effort_values, presence: true
  validates :moves, presence: true

  def initialize(attributes = {})
    super
    @base = Pokemon.find_by(id: @pokemon_id)
    @level = 50
    status_calculate
  end

  def abilities
    ary = base.abilities.split('/') 
    ary << base.hidden_abilities unless base.hidden_abilities.blank?
    ary
  end

  
  private

  def attributes
    {
      pokemon_id: pokemon_id,
      name: name,
      nature: nature,
      ability: ability,
      effort_values: effort_values,
      individual_values: individual_values,
      moves: moves
    }
  end

  def status_calculate
    iv_parse
    ev_parse
  end

  def iv_parse

  end

  def ev_parse

  end
end


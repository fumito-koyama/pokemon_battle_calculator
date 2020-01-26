class PokemonStats
  include ActiveModel::Model

  attr_accessor :pokemon_id, :name, :nature, :nature_raise, :nature_low, :effort_values, :individual_values, :level
  attr_reader :base
  
  validates :pokemon_id, numericality: { only_integer: true }, length: { in: 1..890 }, allow_nil: true

  validates :level, numericality: { only_integer: true }, length: { in: 1..100 }, allow_nil: true
  validate :effort_values_limit_cannot_be_exceeded
  validate :individual_values_limit_cannot_be_exceeded
  validate :natures_effect_must_be_regular



  def initialize(attributes = {})
    super
    set_base
    @level ||= 50 
    @stats = {} 
    set_individual_values
    set_effort_values
    set_nature
  end

  def stats
    [:hp, :attack, :defence, :sp_attack, :sp_defence, :speed].each do |stat|
      calculate_stat(stat)
    end
    @stats
  end

  def hp
    calculate_stat(:hp)
    @stats[:hp]
  end

  def attack
    calculate_stat(:attack)
    @stats[:attack]
  end

  def defence
    calculate_stat(:defence)
    @stats[:defence]
  end

  def sp_attack
    calculate_stat(:sp_attack)
    @stats[:sp_attack]
  end

  def sp_defence
    calculate_stat(:sp_defence)
    @stats[:sp_defence]
  end

  def speed
    calculate_stat(:speed)
    @stats[:speed]
  end

  private
  #デフォルト値
  def set_base
    @base = Pokemon.find_by(id: @pokemon_id)
    @pokemon_id = 488 if @base.nil?
    @base ||= Pokemon.find_by(id: @pokemon_id) 
  end
  #デフォルト値
  def set_individual_values
    @individual_values = set_default_hash(@individual_values, 31)
  end
  #デフォルト値
  def set_effort_values
    @effort_values = set_default_hash(@effort_values, 0)
  end
  #デフォルト値と整形
  def set_nature
    @nature = @nature_raise&.merge(@nature_low){|k,v1,v2| 1}
    @nature ||= Hash.new
    @nature = @nature.map{|k,v| [k.to_sym, v.to_f]}.to_h
    @nature.default = 1
  end

  def set_default_hash(hash, default)
    hash ||= Hash.new(default)
    [:hp, :attack, :defence, :sp_attack, :sp_defence, :speed].each do |stat|
      hash[stat] = hash[stat].to_i if hash[stat].class == String
    end
    hash.default = default
    hash
  end
  #ステータスの計算式
  def calculate_stat(stat)
    return if invalid?
    @stats ||= {} 
    case stat
    when :hp
      @stats[stat] = (@base[stat] * 2 + @individual_values[stat] + @effort_values[stat]/4) * @level / 100 + @level + 10
      @stats[stat] = 1 if @base.number == 292
    else
      @stats[stat] = (((@base[stat]*2 + @individual_values[stat] + @effort_values[stat]/4 ) * @level / 100 + 5) * @nature[stat]).to_i
    end
  end


  def effort_values_limit_cannot_be_exceeded
    errors.add(:effort_values, '努力値の合計は上限510です') if effort_values.values.sum >= 510
    errors.add(:effort_values, '努力値の一つのステータスの上限は252です') if effort_values.values.find{|n| n > 252 }
    errors.add(:effort_values, '努力値の下限は0です') if effort_values.values.find{|n| n < 0 }
  end

  def individual_values_limit_cannot_be_exceeded
    errors.add(:individual_values, '個体値の上限は31です') if individual_values.values.find{|n| n > 31}
    errors.add(:individual_values, '個体値の下限は0です') if individual_values.values.find{|n| n < 0}

  end

  def natures_effect_must_be_regular
    errors.add(:nature, '不正な値です') if nature.values.find{|n| n < 0.9 && n > 1.1}
    size = nature.values.select{|n| n <= 0.9 && n >= 1.1}.size
    errors.add(:nature, '不正な値です') if size > 2 or size == 1
  end

end


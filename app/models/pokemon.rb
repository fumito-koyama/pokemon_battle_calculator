class Pokemon < ApplicationRecord

  def self.type_search (t1, t2=nil)
    t2.nil? ? (ary = [t1]) : (ary = [t1, t2])
    ary.inject(Pokemon) {|poke,t| poke.where('types Like ?', "%#{t}%")}
  end

  # def abilities_ary
  #   ary = abilities.split('/') 
  #   ary << hidden_abilities unless hidden_abilities.blank?
  #   ary
  # end

  def base_sum
    hp + attack + defence + sp_attack + sp_defence + speed
  end

  def full_name
    return name if form.nil?
    "#{name}(#{form})"
  end

  # def evolution_name
  #   Pokemon.find_by(number: evolutions).name
  # end


  private
#   private
#   def type_strengths_and_weakness
#     {
#       'ノーマル' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 1]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [-1, 0]
#         'ゴースト' => [-100, -100]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [-1, 0]
#         'フェアリー' => [0, 0]
#       }
#       'ほのお' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [-1, -1]
#         'みず' => [-1, 1]
#         'でんき' => [0, 0]
#         'くさ' => [1, -1]
#         'こおり' => [1, -1]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 1]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [1, -1]
#         'いわ' => [-1, 1]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [-1, 0]
#         'あく' => [0, 0]
#         'はがね' => [1, -1]
#         'フェアリー' => [0, -1]
#       }
#       'みず' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#       'でんき' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#       'くさ' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#       'こおり' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       'かくとう' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#       'どく' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#       'じめん' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#       'ひこう' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#       'エスパー' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#       'むし' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#       'いわ' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#       'ゴースト' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#       'ドラゴン' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#       'あく' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#       'はがね' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#       'フェアリー' => {
#         'ノーマル' => [0, 0]
#         'ほのお' => [0, 0]
#         'みず' => [0, 0]
#         'でんき' => [0, 0]
#         'くさ' => [0, 0]
#         'こおり' => [0, 0]
#         'かくとう' => [0, 0]
#         'どく' => [0, 0]
#         'じめん' => [0, 0]
#         'ひこう' => [0, 0]
#         'エスパー' => [0, 0]
#         'むし' => [0, 0]
#         'いわ' => [0, 0]
#         'ゴースト' => [0, 0]
#         'ドラゴン' => [0, 0]
#         'あく' => [0, 0]
#         'はがね' => [0, 0]
#         'フェアリー' => [0, 0]
#       }
#     }
#   end
end
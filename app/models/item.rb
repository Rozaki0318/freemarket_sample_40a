class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :size
  has_many :images
  mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :images

  enum condition: [:lv0, :lv1, :lv2, :lv3, :lv4, :lv5, :lv6]
  enum shipping_fee: [:f0, :f1, :f2]
  enum shipping_from: [:noarea, :hkd, :aomr, :iwt, :myg, :akt, :ymgt, :hksm, :ibrk, :tcg, :gnm, :sitm, :cb, :tky, :kngw, :nigt, :tym, :iskw, :hki, :ymns, :ngn, :gf, :szok, :aic, :mie, :siga, :kyt, :osk, :hyg, :nara, :wkym, :ttr, :smn, :okym, :hrsm, :ymgc, :tksm, :kgw, :ehm, :kuc, :hkok, :saga, :ngsk, :kmmt, :oit, :myzk, :kgsm, :oknw, :notyet]
  enum shipping_date: [:d0, :d1, :d2, :d3]
  enum shipping_way: [:w0, :w1, :w2, :w3, :w4, :w5, :w6, :w7, :w8, :w9]

  validates :name, presence: true
  validates :description, presence: true
  validates :size_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :condition, presence: true, exclusion: { in: %w(lv0) }
  validates :shipping_from, presence: true, exclusion: { in: %w(noarea) }
  validates :shipping_date, presence: true, exclusion: { in: %w(d0) }
  validates :shipping_fee, presence: true, exclusion: { in: %w(f0) }
  validates :shipping_way, presence: true, exclusion: { in: %w(w0) }
  validates :category_id, presence: true
end

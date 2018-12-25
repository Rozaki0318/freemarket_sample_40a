class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :images
  mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :images

  enum condition: [:lv0, :lv1, :lv2, :lv3, :lv4, :lv5, :lv6]
  enum shipping_fee: [:f0, :f1, :f2]
  enum shipping_from: [:noarea, :hkd, :aomr, :iwt, :myg, :akt, :ymgt, :hksm, :ibrk, :tcg, :gnm, :sitm, :cb, :tky, :kngw, :nigt, :tym, :iskw, :hki, :ymns, :ngn, :gf, :szok, :aic, :mie, :siga, :kyt, :osk, :hyg, :nara, :wkym, :ttr, :smn, :okym, :hrsm, :ymgc, :tksm, :kgw, :ehm, :kuc, :hkok, :saga, :ngsk, :kmmt, :oit, :myzk, :kgsm, :oknw, :notyet]
  enum shipping_date: [:d0, :d1, :d2, :d3]
  enum shipping_way: [:w0, :w1, :w2, :w3, :w4, :w5, :w6, :w7, :w8, :w9]
  enum size: [:s0, :s1, :s2, :s3, :s4, :s5, :s6, :s7, :s8, :s9, :s10,
              :s11, :s12, :s13, :s14, :s15, :s16, :s17, :s18, :s19, :s20,
              :s21, :s22, :s23, :s24, :s25, :s26, :s27, :s28, :s29, :s30,
              :s31, :s32, :s33, :s34, :s35, :s36, :s37, :s38, :s39, :s40,
              :s41, :s42, :s43, :s44, :s45, :s46, :s47, :s48, :s49, :s50,
              :s51, :s52, :s53, :s54, :s55, :s56, :s57, :s58, :s59, :s60,
              :s61, :s62, :s63, :s64, :s65, :s66, :s67, :s68, :s69, :s70,
              :s71, :s72, :s73, :s74, :s75, :s76, :s77, :s78, :s79, :s80]

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :condition, presence: true, exclusion: { in: %w(lv0) }
  validates :shipping_from, presence: true, exclusion: { in: %w(noarea) }
  validates :shipping_date, presence: true, exclusion: { in: %w(d0) }
  validates :shipping_fee, presence: true, exclusion: { in: %w(f0) }
  validates :shipping_way, presence: true, exclusion: { in: %w(w0) }
  validates :size, presence: true
  validates :category_id, presence: true
end

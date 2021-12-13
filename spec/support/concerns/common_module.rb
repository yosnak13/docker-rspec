require 'rails_helper'

# 共通化するテストケースを定義
shared_examples '価格の表示' do
  let(:object_name) { 'described_class.to_s.underscore.to_sym' }
  let(:model) { FactoryBot.build(object_name) }

  describe '税込み価格が計算されること' do
    it '8%加算されること' do
      expect(model.tax_included_price(100)).to eq 108
    end

    it '8%加算され、少数が切り捨てられること' do
      expect(model.tax_included_price(101)).to eq 109
    end
  end
end

require 'rails_helper'

RSpec.describe "FoodEnquete", type: :system do
  describe '正常' do
    context 'アンケートに回答する' do
      it '回答できること' do
        enquete = FactoryBot.create(:food_enquete_tanaka)
        visit "/food_enquetes/new"
        fill_in 'お名前', with: enquete.name
        fill_in 'メールアドレス', with: enquete.mail
        fill_in '年齢', with: enquete.age
        select enquete.food_name, from: 'お召し上がりになった料理'
        choose "food_enquete_score_#{enquete.score}"
        fill_in 'food_enquete[request]', with: enquete.request
        select enquete.present_name, from: 'ご希望のプレゼント'

        click_button '登録する'

        expect(page).to have_content 'ご回答ありがとうございました'
        expect(page).to have_content 'お名前: 田中 太郎'
        expect(page).to have_content 'メールアドレス: taro.tanaka@example.com'
        expect(page).to have_content '年齢: 25'
        expect(page).to have_content 'お召し上がりになった料理: やきそば'
        expect(page).to have_content '満足度: 良い'
        expect(page).to have_content 'ご意見・ご要望: おいしかったです。'
        expect(page).to have_content 'ご希望のプレゼント: 【10名に当たる】ビール飲み放題'
      end
    end
  end
end

require 'rails_helper'

describe 'Article show', type: :feature do
  let!(:article) { create(:article) }

  it "show" do
    visit '/'
    expect(page).to have_link article.title
    click_on article.title
    expect(page).to have_content article.title
  end

  it "edit" do
    visit '/'
    expect(page).to have_link 'Edit'
    click_on 'Edit'
    fill_in 'article[title]', with: 'new article'
    click_on 'Update Article'
    expect(page).to have_content 'new article'
  end

end

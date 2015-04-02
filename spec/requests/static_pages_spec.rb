# require 'spec_helper'
require "rails_helper"

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit '/' }

    it { should have_content('Sample App') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit '/help' }

    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit '/about' }

    it { should have_content('About') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit '/contact' }

    it { should have_title(full_title('Contact')) }
    it { should have_selector('h1', text: 'Contact') }
  end

  it "should have the right links on the layout" do
    visit '/about'
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    visit '/help'
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    visit '/contact'
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    visit '/'
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to_not have_title(full_title('Home'))
    click_link "sample app"
    expect(page).to have_title(full_title('Sign up'))
  end

end

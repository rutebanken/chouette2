# -*- coding: utf-8 -*-
require 'spec_helper'

describe "TimeTables", :type => :feature do
  login_user

  let!(:time_tables) { Array.new(2) { create(:time_table) } }
  subject { time_tables.first }

  describe "list" do
    it "display time_tables" do
      visit referential_time_tables_path(referential)
      expect(page).to have_content(time_tables.first.comment)
      expect(page).to have_content(time_tables.last.comment)
    end

  end

  describe "show" do
    it "display time_table" do
      visit referential_time_tables_path(referential)
      click_link "#{time_tables.first.comment}"
      expect(page).to have_content(time_tables.first.comment)
    end

  end

  describe "new" do
    it "creates time_table and return to show" do
      visit referential_time_tables_path(referential)
      click_link I18n.t("time_tables.actions.new")
      fill_in I18n.t("activerecord.attributes.time_table.comment"), :with => "TimeTable 1"
      fill_in I18n.t("activerecord.attributes.time_table.objectid"), :with => "test:Timetable:1"
      click_button(I18n.t('formtastic.create',model: I18n.t('activerecord.models.time_table.one')))
      expect(page).to have_content("TimeTable 1")
    end
  end

  describe "edit and return to show" do
    it "edit time_table" do
      visit referential_time_table_path(referential, subject)
      click_link I18n.t("time_tables.actions.edit")
      fill_in I18n.t("activerecord.attributes.time_table.comment"), :with => "TimeTable Modified"
      click_button(I18n.t('formtastic.update',model: I18n.t('activerecord.models.time_table.one')))
      expect(page).to have_content("TimeTable Modified")
    end
  end

end

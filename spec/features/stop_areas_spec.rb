# -*- coding: utf-8 -*-
require 'spec_helper'

describe "StopAreas", :type => :feature do
  login_user

  let!(:stop_areas) { Array.new(2) { create(:stop_area) } }
  subject { stop_areas.first }

  describe "list" do
    it "display stop_areas" do
      visit referential_stop_areas_path(referential)
      expect(page).to have_content(stop_areas.first.name)
      expect(page).to have_content(stop_areas.last.name)
    end    
  end

  describe "show" do      
    it "display stop_area" do
      visit referential_stop_areas_path(referential)
      click_link "#{stop_areas.first.name}"
      expect(page).to have_content(stop_areas.first.name)
    end

    it "display map" do
      visit referential_stop_areas_path(referential)
      click_link "#{stop_areas.first.name}"
      expect(page).to have_selector("#map.stop_area")
    end
    
  end

  describe "new" do      
    it "creates stop_area and return to show" do
      pending "NRP: deleted in setup"
      visit referential_stop_areas_path(referential)
      click_link I18n.t("stop_areas.actions.new")
      fill_in "stop_area_name", :with => "StopArea 1"
      fill_in I18n.t("activerecord.attributes.stop_area.registration_number"), :with => "test-1"
      fill_in I18n.t("activerecord.attributes.stop_area.objectid"), :with => "test:StopArea:1"
      click_button(I18n.t('formtastic.create',model: I18n.t('activerecord.models.stop_area.one')))
      expect(page).to have_content("StopArea 1")
    end
  end

  describe "edit and return to show" do
    it "edit stop_area" do
      pending "NRP: deleted in setup"
      visit referential_stop_area_path(referential, subject)
      click_link I18n.t("stop_areas.actions.edit")
      fill_in "stop_area_name", :with => "StopArea Modified"
      fill_in I18n.t("activerecord.attributes.stop_area.registration_number"), :with => "test-1"
      click_button(I18n.t('formtastic.update',model: I18n.t('activerecord.models.stop_area.one')))
      expect(page).to have_content("StopArea Modified")
    end
  end

end

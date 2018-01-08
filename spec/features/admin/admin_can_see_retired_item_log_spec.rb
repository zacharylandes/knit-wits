describe "Admin visits analytics dashboard" do
  it "sees all items that have been retired with count of times retired" do
    item_1, item_2, item_3, item_4, item_5 = create_list(:item, 5)
    create_list(:retired_item, 10, item: item_1)
    create_list(:retired_item, 7, item: item_3)
    create_list(:retired_item, 5, item: item_2)
    create_list(:retired_item, 2, item: item_5)
    create_list(:retired_item, 1, item: item_4)
    item_1.update_column(:status, "retired")
    item_3.update_column(:status, "retired")
    item_5.update_column(:status, "retired")

    visit admin_analytics_dashboard_path
    item_1_caps = item_1.title.capitalize
    item_2_caps = item_2.title.capitalize
    item_3_caps = item_3.title.capitalize
    item_4_caps = item_4.title.capitalize
    item_5_caps = item_5.title.capitalize


    within ".retired-items" do
      expect(item_1_caps).to appear_before(item_3_caps)
      expect(item_3_caps).to appear_before(item_2_caps)
      expect(item_2_caps).to appear_before(item_5_caps)
      expect(item_5_caps).to appear_before(item_4_caps)
      expect(item_4_caps).to_not appear_before(item_5_caps)
    end
  end
end

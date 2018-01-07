describe "Admin can visit dashboard" do
  describe "it sees a table with orders" do
    before(:each) do
      @ordered = create(:order)
      @paid = create(:order, status: 1)
      @cancelled = create(:order, status: 2)
      @completed = create(:order, status: 3)
      @admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end

    it "sees all orders with a link to each order" do
      visit admin_dashboard_path

      expect(page).to have_content "Orders"
      expect(page).to have_link @ordered.id
      expect(page).to have_content @ordered.status
      expect(page).to have_link @paid.id
      expect(page).to have_content @paid.status
      expect(page).to have_link @cancelled.id
      expect(page).to have_content @cancelled.status
      expect(page).to have_link @completed.id
      expect(page).to have_content @completed.status
    end

    it "sees total number of each type of order" do
      visit admin_dashboard_path

      expect(page).to have_content "Orders by Status"
      expect(page).to have_content "Ordered 1"
      expect(page).to have_content "Paid 1"
      expect(page).to have_content "Cancelled 1"
      expect(page).to have_content "Completed 1"
    end

    it "it can filter orders by status type" do
      visit admin_dashboard_path

      select "Paid", from: "status"
      click_on "Apply"

      within ".all-orders" do
        expect(page).to have_content ("Paid")
        expect(page).to_not have_content ("Ordered")
        expect(page).to_not have_content ("Cancelled")
        expect(page).to_not have_content ("Completed")
      end
    end

    describe "it sees buttons to transition between status types" do
      context "status: Ordered" do
        it "has button to cancel order and mark as paid" do
          visit admin_dashboard_path

          within "#1" do
            expect(page).to have_button "mark as paid"
            expect(page).to have_button "cancel"
          end
        end

        it "can cancel order with cancel button" do
          visit admin_dashboard_path

          within "#1" do
            click_button "cancel"
          end

          within "#1" do
            expect(page).to have_content "Cancelled"
            expect(page).to_not have_content "Ordered"
          end
        end

        it "can mark as paid" do
          visit admin_dashboard_path

          within "#1" do
            click_button "mark as paid"
          end

          within "#1" do
            expect(page).to have_content "Paid"
            expect(page).to_not have_content "Ordered"
          end
        end
      end

      context "status: Paid" do
        it "has button to cancel order and mark as paid" do
          visit admin_dashboard_path

          within "#2" do
            expect(page).to have_button "mark as complete"
            expect(page).to have_button "cancel"
          end
        end

        it "can cancel order with cancel button" do
          visit admin_dashboard_path

          within "#2" do
            click_button "cancel"
          end

          within "#2" do
            expect(page).to have_content "Cancelled"
            expect(page).to_not have_content "Paid"
          end
        end

        it "can mark as paid" do
          visit admin_dashboard_path

          within "#2" do
            click_button "mark as complete"
          end

          within "#2" do
            expect(page).to have_content "Complete"
            expect(page).to_not have_content "Paid"
          end
        end
      end

      context "status: Cancelled" do
        it "does not have button to cancel order" do
          visit admin_dashboard_path

          within "#3" do
            expect(page).to_not have_button "cancel"
          end
        end
      end

      context "status: Completed" do
        it "does not have button to cancel order" do
          visit admin_dashboard_path

          within "#4" do
            expect(page).to_not have_button "cancel"
          end
        end
      end
    end
  end
end

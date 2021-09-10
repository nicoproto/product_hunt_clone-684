require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url # "/"

    # save_and_open_screenshot
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count
  end

  test "allows a signed in user to create a product" do
    login_as users(:niram)

    visit "/products/new"

    # save_and_open_screenshot

    fill_in "product_name", with: "Shampoo for bald people"
    fill_in "product_tagline", with: "Makes your 'hair' grow"

    click_on "Create Product"

    assert_equal root_path, page.current_path
    assert_text "Makes your 'hair' grow"
  end

end

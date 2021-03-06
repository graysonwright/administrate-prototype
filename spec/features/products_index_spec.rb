require "rails_helper"

RSpec.describe "product index page" do
  it "displays products' name and description" do
    product = create(:product)

    visit products_path

    expect(page).to have_header("Products")
    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
  end

  it "links to the product show page" do
    product = create(:product)

    visit products_path
    click_on product.name

    expect(current_path).to eq(product_path(product))
    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
  end

  it "links to the edit page" do
    product = create(:product)

    visit products_path
    click_on "Edit"

    expect(current_path).to eq(edit_product_path(product))
  end

  it "links to the new page" do
    visit products_path
    click_on("New product")

    expect(current_path).to eq(new_product_path)
  end
end

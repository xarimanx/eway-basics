class GeneralPage < SitePrism::Page

  element :submit, 'input[name="commit"]'

  private

  def all_visible?(*item_list)
    item_list.all? { |item| self.send(item).visible? }
  end
end

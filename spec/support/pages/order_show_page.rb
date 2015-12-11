class OrderShowPage
  include PageObject

  button(:back, link: 'Back')
  button(:edit, link: 'Edit')
  button(:delete, link: 'Delete')
end
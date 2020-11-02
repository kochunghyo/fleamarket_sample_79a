class Category < ActiveHash::Base
  
  self.data = [
      {id: 1, name: '食品'}, {id: 2, name: '衣料品'} , {id: 3, name: '日用消耗品'}
  ]
end
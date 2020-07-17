class Status < ActiveHash::Base
  self.data = [
    {id: 1, name: "交渉中"},
    {id: 2, name: "受注"},
    {id: 3, name: "失注"},
    {id: 4, name: "試作"},
    {id: 5, name: "開発段階"},
    {id: 6, name: "参考見積り"},
    {id: 7, name: "その他"},
  ]
end

# 10.times do |i|
#   User.create(email: "hoge#{i}@example.com", password: "11111111", password_confirmation: "11111111", name: "user#{i}", admin: "f")
# end

business = %w[ドラッグストア スーパーマーケット 総合スーパー アパレル 専門店 コンビニ その他]
prefectures = %w[東京都 東京都 宮城県 東京都 愛知県 福岡県 大阪府]
city = %w[中央区 渋谷区 仙台市青葉区 渋谷区 名古屋市中区 福岡市中央区 大阪市中央区]
town_name = %w[銀座3 神南1 一番町3 神宮前4 栄3 天神2 心斎橋1]
0.upto(9) do |idx|
  Customer.create(
    customer_name: "株式会社サムライ#{idx + 7 }",
    postal_code: "100-123#{idx}",
    business: "#{business[idx]}",
    prefectures: "#{prefectures[idx]}",
    city: city[idx],
    town_name: town_name[idx],
    phone_number: "03-1234-987#{idx}",
    fax_number: "03-1234-789#{idx}",
    url: "http://www.samurai#{idx}.com"
  )
end

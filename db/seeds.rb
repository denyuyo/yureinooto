# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p '==================== admin create ===================='
Admin.create!(email: "neko@neko", password: "111111")

p '==================== user create ===================='
users = User.create!(
  [
    { name: "ねむい", email: "nemui@gmail.com", password: "nnnnnn", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/nemui.jpg"), filename: "sample-user1.jpg") },
    { name: "ふらみん", email: "flamin@gmail.com", password: "ffffff", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/flamin.jpg"), filename: "sample-user2.jpg") },
    { name: "Kino", email: "kinoko@gmail.com", password: "222222", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kinoko.jpg"), filename: "sample-user3.jpg") },
    { name: "ねこまた", email: "nekomata@gmail.com", password: "888888", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/neko.jpg"), filename: "sample-user4.jpg") }
  ]
)

p '==================== tag create ===================='
Tag.create!(tag_name: "歴史的建造物")
Tag.create!(tag_name: "世界遺産")
Tag.create!(tag_name: "ロシアの世界遺産")
Tag.create!(tag_name: "日本の世界遺産")
Tag.create!(tag_name: "韓国の世界遺産")
Tag.create!(tag_name: "中国の世界遺産")
Tag.create!(tag_name: "ヨーロッパの世界遺産")

p '==================== post create ===================='
user_ids = User.pluck(:id) # Userモデルのすべてのidを取得
tags =Tag.all

posts = [
    {  title: "タージ・マハル", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/taj-mahal.jpg"), filename: "sample-post1.jpg"), content: "真っ白い外観が、チョコレートのお城みたいで特別な雰囲気に浸れます" },
    {  title: "厳島神社", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/itsukushima.jpg"), filename: "sample-post2.jpg"), content: "水位が浅いときはもう少し近くで鳥居を拝めそう" },
    {  title: "済州火山島と溶岩洞窟群", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/korea.jpg"), filename: "sample-post3.jpg"), content: "韓国で初めて登録された世界自然遺産です。絶滅の危機にさらされている稀少な動植物が多数生息しており、「韓国のハワイ」とも呼ばれています" },
    {  title: "ヴァルカモニカの岩絵群", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/monika.jpg"), filename: "sample-post4.jpg"), content: "ヴァルカモニカはイタリアの渓谷で、棒人間やトナカイのような絵が8000年間に渡って岩に描かれ続けました" },
    {  title: "ケルン大聖堂", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/europe.jpg"), filename: "sample-post5.jpg"), content: "ステンドグラスがドット絵みたいで、懐かしのレトロゲームを思い出した" },
    {  title: "モスクワのクレムリンと赤の広場", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/belfry.jpg"), filename: "sample-post6.jpg"), content: "クレムリンはロシア語で「城塞」を意味します。赤の広場では軍事パレードなども行われており、ソ連時代にはレーニンの遺体を安置したレーニン廟が中心とされていました" },
    {  title: "青海可可西里（フフシル）", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/dolomites.jpg"), filename: "sample-post7.jpg"), content: "山がかき氷みたいできれいだった。あとヤギみたいに角がまっすぐの鹿がいて、ちょっとびっくりした" },
    {  title: "白神山地", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/shirakami.jpg"), filename: "sample-post8.jpg"), content: "森のにおいがして、心が落ち着いた。また行きたい" }
  ]
  posts.each_with_index do |post,i|
    tag = nil
    if i == 0 || i == 2
      tag = Tag.find_by(tag_name: "歴史的建造物")
    else
      tag = tags.sample
    end
    p = Post.new(post)
    user_id = user_ids.sample
    p.user_id = user_id
    p.save!
    p.tags = [tag]
    p.save
  end

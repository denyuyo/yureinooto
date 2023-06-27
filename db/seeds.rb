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
User.create!(name: "ラムネ", email: "ramune@gmail.com", password: "777777")
User.create!(name: "ふらみん", email: "flamin@gmail.com", password: "ffffff")
User.create!(name: "鳥", email: "tori@gmail.com", password: "tttttt")
User.create!(name: "ねこさん", email: "nekosan@gmail.com", password: "333333")

p '==================== tag create ===================='
Tag.create!(tag_name: "歴史的建造物")
Tag.create!(tag_name: "世界遺産")
Tag.create!(tag_name: "ロシアの世界遺産")
Tag.create!(tag_name: "日本の世界遺産")
Tag.create!(tag_name: "韓国の世界遺産")
Tag.create!(tag_name: "中国の世界遺産")
Tag.create!(tag_name: "ヨーロッパの世界遺産")

p '==================== post create ===================='
Post.create!(user_id: 4,tag_id: 2,title: "タージ・マハル",
content: "真っ白い外観が、チョコレートのお城みたいで特別な雰囲気に浸れます",)
Post.create!(user_id: 3,tag_id: 4,title: "厳島神社",
content: "水位が浅いときはワンチャン鳥居に触れそう",)
Post.create!(user_id: 2,tag_id: 5,title: "済州火山島と溶岩洞窟群",
content: "韓国で初めて登録された世界自然遺産です。絶滅の危機にさらされている稀少な動植物が多数生息しており、「韓国のハワイ」とも呼ばれています",)
Post.create!(user_id: 3,tag_id: 7,title: "ヴァルカモニカの岩絵群",
content: "ヴァルカモニカはイタリアの渓谷で、棒人間やトナカイのような絵が8000年間に渡って岩に描かれ続けました",)
Post.create!(user_id: 2,tag_id: 2,title: "ケルン大聖堂",
content: "ステンドグラスがドット絵みたいで、懐かしのレトロゲームを思い出した",)
Post.create!(user_id: 4,tag_id: 3,title: "モスクワのクレムリンと赤の広場",
content: "クレムリンはロシア語で「城塞」を意味します。赤の広場では軍事パレードなども行われており、ソ連時代にはレーニンの遺体を安置したレーニン廟が中心とされていました",)
Post.create!(user_id: 1,tag_id: 6,title: "青海可可西里（フフシル）",
content: "山がかき氷みたいできれいだった。あとヤギみたいに角がまっすぐの鹿がいて、ちょっとびっくりした",)
Post.create!(user_id: 1,tag_id: 4,title: "白神山地",
content: "森のにおいがして、心が落ち着いた。また行きたい",)
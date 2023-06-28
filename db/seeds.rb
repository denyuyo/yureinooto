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
user_ids = User.pluck(:id) # Userモデルのすべてのidを取得
tag_ids = Tag.pluck(:id) # Tagモデルのすべてのidを取得

user_id = user_ids.sample # ランダムに1つのuser_idを選択
tag_id = tag_ids.sample # ランダムに1つのtag_idを選択

Post.create!(user_id, tag_id, title: "タージ・マハル",
content: "真っ白い外観が、チョコレートのお城みたいで特別な雰囲気に浸れます", image: "https://4.bp.blogspot.com/-vS3lwA3hvFM/W8hD_amqbLI/AAAAAAABPhU/nLwxTlb4490vTYDYcHfAhNYqWCgt7iFfQCLcBGAs/s800/saigai_machi_boroboro.png")
Post.create!(user_id, tag_id, title: "厳島神社",
content: "水位が浅いときはもう少し近くで鳥居を拝めそう", image: "itukushima-jinjya.")
Post.create!(user_id, tag_id, title: "済州火山島と溶岩洞窟群",
content: "韓国で初めて登録された世界自然遺産です。絶滅の危機にさらされている稀少な動植物が多数生息しており、「韓国のハワイ」とも呼ばれています", image: "https://3.bp.blogspot.com/-AqRKBdxJ_9M/W0mF8vtEA5I/AAAAAAABNVs/-UC9fztQBkszcFpXElSz5wNjJPHPJap5wCLcBGAs/s800/landmark_zaou_okama.png")
Post.create!(user_id, tag_id, title: "ヴァルカモニカの岩絵群",
content: "ヴァルカモニカはイタリアの渓谷で、棒人間やトナカイのような絵が8000年間に渡って岩に描かれ続けました", image: "https://2.bp.blogspot.com/-f2lEmykPP38/VOsJ_8LVGhI/AAAAAAAArwY/ZJ0oT4fXe3E/s800/nasca_hachidori.png")
Post.create!(user_id, tag_id, title: "ケルン大聖堂",
content: "ステンドグラスがドット絵みたいで、懐かしのレトロゲームを思い出した", image: "https://3.bp.blogspot.com/-B4kXgTY4qD4/WKFjC2vpd-I/AAAAAAABBtE/lxWgqO44Zeof4GPUotel_HHfR5bbVd4mwCLcB/s800/landmark_notre_dame.png")
Post.create!(user_id, tag_id, title: "モスクワのクレムリンと赤の広場",
content: "クレムリンはロシア語で「城塞」を意味します。赤の広場では軍事パレードなども行われており、ソ連時代にはレーニンの遺体を安置したレーニン廟が中心とされていました", image: "https://4.bp.blogspot.com/-U2k4sFP8j_4/VOsJfpkpCKI/AAAAAAAArok/XpMCZmuJeIA/s800/pole_southpole.png")
Post.create!(user_id, tag_id, title: "青海可可西里（フフシル）",
content: "山がかき氷みたいできれいだった。あとヤギみたいに角がまっすぐの鹿がいて、ちょっとびっくりした", image: "https://3.bp.blogspot.com/-Q2NZIuLYABQ/Wp94hTejeoI/AAAAAAABKuQ/kNm8uXQhwDczKXpKBDqjFyAut3yHJnXyACLcBGAs/s800/world_giza_pyramid_white.png")
Post.create!(user_id, tag_id, title: "白神山地",
content: "森のにおいがして、心が落ち着いた。また行きたい", image: "https://1.bp.blogspot.com/-0p1ostXcCUI/VOsJfPTv6BI/AAAAAAAAroc/wIsD9BmFV8k/s800/pole_northpole.png")